import 'package:flutter/material.dart';
import 'package:your_venue_admin/core/cnostants/app_colors.dart';
import 'package:your_venue_admin/features/authentication/view/widgets/login_card.dart';
import 'package:your_venue_admin/features/authentication/view/widgets/logo_section.dart';

class LoginSection extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final ValueNotifier<bool> hidePassword;
  final bool isLoading;
  final VoidCallback onLogin;

  const LoginSection({
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.hidePassword,
    required this.isLoading,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: Column(
              children: [
                const AdminLogoSection(),
                const SizedBox(height: 34),
                LoginCard(
                  formKey: formKey,
                  emailController: emailController,
                  passwordController: passwordController,
                  hidePassword: hidePassword,
                  isLoading: isLoading,
                  onLogin: onLogin,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}