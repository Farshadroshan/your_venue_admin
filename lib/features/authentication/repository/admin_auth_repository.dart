import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdminAuthException implements Exception {
  final String message;

  const AdminAuthException(this.message);

  @override
  String toString() => message;
}

class AdminAuthRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  AdminAuthRepository({
    FirebaseAuth? firebaseAuth,
    FirebaseFirestore? firestore,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
       _firestore = firestore ?? FirebaseFirestore.instance;

  Future<User> loginAdmin({
    required String email,
    required String password,
  }) async {
    try {
      // Step 1: Authenticate the email and password.
      final UserCredential credential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email.trim(), password: password);

      final User? user = credential.user;

      if (user == null) {
        throw const AdminAuthException(
          'Unable to authenticate the admin account.',
        );
      }

      // Step 2: Check whether this UID exists in the admins collection.
      final DocumentSnapshot<Map<String, dynamic>> adminDocument =
          await _firestore
              .collection('admins')
              .doc(user.uid)
              .get(const GetOptions(source: Source.server));

      final Map<String, dynamic>? adminData = adminDocument.data();

      final bool hasAdminRole =
          adminDocument.exists && adminData?['role'] == 'admin';

      final bool isActive = adminData?['isActive'] == true;

      if (!hasAdminRole) {
        await _firebaseAuth.signOut();

        throw const AdminAuthException('You do not have admin permission.');
      }

      if (!isActive) {
        await _firebaseAuth.signOut();

        throw const AdminAuthException('Your admin account has been disabled.');
      }

      return user;
    } on FirebaseAuthException catch (error) {
      throw AdminAuthException(_getAuthErrorMessage(error.code));
    } on FirebaseException catch (error) {
      throw AdminAuthException(_getFirestoreErrorMessage(error.code));
    }
  }

  Future<bool> checkCurrentUserIsAdmin() async {
    final User? user = _firebaseAuth.currentUser;

    if (user == null) {
      return false;
    }

    try {
      final DocumentSnapshot<Map<String, dynamic>> adminDocument =
          await _firestore
              .collection('admins')
              .doc(user.uid)
              .get(const GetOptions(source: Source.server));

      final Map<String, dynamic>? adminData = adminDocument.data();

      return adminDocument.exists &&
          adminData?['role'] == 'admin' &&
          adminData?['isActive'] == true;
    } catch (_) {
      return false;
    }
  }

  Future<void> logoutAdmin() async {
    await _firebaseAuth.signOut();
  }

  User? get currentAdmin => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  String _getAuthErrorMessage(String code) {
    switch (code) {
      case 'invalid-email':
        return 'Please enter a valid email address.';

      case 'invalid-credential':
      case 'wrong-password':
      case 'user-not-found':
        return 'Invalid admin email or password.';

      case 'user-disabled':
        return 'This account has been disabled.';

      case 'too-many-requests':
        return 'Too many login attempts. Please try again later.';

      case 'network-request-failed':
        return 'Please check your internet connection.';

      default:
        return 'Admin login failed. Please try again.';
    }
  }

  String _getFirestoreErrorMessage(String code) {
    switch (code) {
      case 'permission-denied':
        return 'You do not have permission to access the admin portal.';

      case 'unavailable':
        return 'The service is temporarily unavailable.';

      default:
        return 'Unable to verify admin permission.';
    }
  }
}
