part of 'admin_auth_bloc.dart';

sealed class AdminAuthState {
  const AdminAuthState();
}

/// Application has just started.
final class AdminAuthInitial extends AdminAuthState {
  const AdminAuthInitial();
}

/// Checking whether Firebase has an existing admin session.
final class AdminAuthChecking extends AdminAuthState {
  const AdminAuthChecking();
}

/// Login request is currently processing.
final class AdminLoginLoading extends AdminAuthState {
  const AdminLoginLoading();
}

/// Logout request is currently processing.
final class AdminLogoutLoading extends AdminAuthState {
  final User admin;

  const AdminLogoutLoading({required this.admin});
}

/// User is authenticated and has admin permission.
final class AdminAuthenticated extends AdminAuthState {
  final User admin;

  const AdminAuthenticated({required this.admin});
}

/// No authenticated admin session exists.
final class AdminUnauthenticated extends AdminAuthState {
  const AdminUnauthenticated();
}

/// Login or authentication operation failed.
final class AdminAuthFailure extends AdminAuthState {
  final String message;

  const AdminAuthFailure({required this.message});
}
