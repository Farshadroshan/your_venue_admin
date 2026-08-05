part of 'admin_auth_bloc.dart';

sealed class AdminAuthEvent {
  const AdminAuthEvent();
}

final class CheckAdminAuthEvent extends AdminAuthEvent {
  const CheckAdminAuthEvent();
}

final class LoginAdminEvent extends AdminAuthEvent {
  final String email;
  final String password;

  const LoginAdminEvent({
    required this.email,
    required this.password,
  });
}

final class LogoutAdminEvent extends AdminAuthEvent {
  const LogoutAdminEvent();
}