
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_venue_admin/features/authentication/view_modes/bloc/admin_auth_bloc/admin_auth_bloc.dart';
import 'package:your_venue_admin/features/dashboard/view/screens/dashboard_screen.dart.dart';
import 'admin_login_screen.dart';

class AdminAuthGate extends StatelessWidget {
  const AdminAuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminAuthBloc, AdminAuthState>(
      builder: (context, state) {
        // Show splash only during the initial Firebase session check.
        if (state is AdminAuthInitial ||
            state is AdminAuthChecking) {
          return const _AdminSplashScreen();
        }

        // Keep dashboard visible during logout processing.
        if (state is AdminAuthenticated ||
            state is AdminLogoutLoading) {
          return const DashboardScreen();
        }

        /*
         * These states display the login screen:
         *
         * AdminUnauthenticated
         * AdminLoginLoading
         * AdminAuthFailure
         *
         * Therefore, the login screen is not removed while Firebase
         * is checking the entered email and password.
         */
        return const AdminLoginScreen();
      },
    );
  }
}

class _AdminSplashScreen extends StatelessWidget {
  const _AdminSplashScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF7F9FC),
      body: Center(
        child: CircularProgressIndicator(
          color: Color(0xFF062E58),
        ),
      ),
    );
  }
}