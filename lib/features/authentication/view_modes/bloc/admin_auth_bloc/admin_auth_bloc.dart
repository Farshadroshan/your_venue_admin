import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repository/admin_auth_repository.dart';

part 'admin_auth_event.dart';
part 'admin_auth_state.dart';

class AdminAuthBloc extends Bloc<AdminAuthEvent, AdminAuthState> {
  final AdminAuthRepository adminAuthRepository;

  AdminAuthBloc({
    required this.adminAuthRepository,
  }) : super(const AdminAuthInitial()) {
    on<CheckAdminAuthEvent>(_onCheckAdminAuth);
    on<LoginAdminEvent>(_onLoginAdmin);
    on<LogoutAdminEvent>(_onLogoutAdmin);
  }

  Future<void> _onCheckAdminAuth(
    CheckAdminAuthEvent event,
    Emitter<AdminAuthState> emit,
  ) async {
    emit(const AdminAuthChecking());

    try {
      // Wait until Firebase restores the browser login session.
      final User? currentUser =
          await adminAuthRepository.authStateChanges.first;

      if (currentUser == null) {
        emit(const AdminUnauthenticated());
        return;
      }

      final bool isAdmin =
          await adminAuthRepository.checkCurrentUserIsAdmin();

      if (!isAdmin) {
        await adminAuthRepository.logoutAdmin();
        emit(const AdminUnauthenticated());
        return;
      }

      emit(
        AdminAuthenticated(
          admin: currentUser,
        ),
      );
    } catch (_) {
      emit(
        const AdminAuthFailure(
          message: 'Unable to verify the admin session.',
        ),
      );
    }
  }

  Future<void> _onLoginAdmin(
    LoginAdminEvent event,
    Emitter<AdminAuthState> emit,
  ) async {
    // This keeps AdminLoginScreen visible.
    emit(const AdminLoginLoading());

    try {
      final User admin = await adminAuthRepository.loginAdmin(
        email: event.email,
        password: event.password,
      );

      emit(
        AdminAuthenticated(
          admin: admin,
        ),
      );
    } on AdminAuthException catch (error) {
      emit(
        AdminAuthFailure(
          message: error.message,
        ),
      );
    } catch (_) {
      emit(
        const AdminAuthFailure(
          message: 'Something went wrong. Please try again.',
        ),
      );
    }
  }

  Future<void> _onLogoutAdmin(
    LogoutAdminEvent event,
    Emitter<AdminAuthState> emit,
  ) async {
    final User? currentAdmin =
        adminAuthRepository.currentAdmin;

    if (currentAdmin == null) {
      emit(const AdminUnauthenticated());
      return;
    }

    // This keeps the dashboard visible during logout.
    emit(
      AdminLogoutLoading(
        admin: currentAdmin,
      ),
    );

    try {
      await adminAuthRepository.logoutAdmin();

      emit(const AdminUnauthenticated());
    } catch (_) {
      // Return to authenticated state when logout fails.
      emit(
        AdminAuthenticated(
          admin: currentAdmin,
        ),
      );
    }
  }
}