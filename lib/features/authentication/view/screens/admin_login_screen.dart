import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:your_venue_admin/features/authentication/view/widgets/login_information_section.dart';
import 'package:your_venue_admin/features/authentication/view/widgets/login_section.dart';
import 'package:your_venue_admin/features/authentication/view_modes/bloc/admin_auth_bloc/admin_auth_bloc.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final ValueNotifier<bool> _hidePassword = ValueNotifier<bool>(true);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _hidePassword.dispose();
    super.dispose();
  }

  void _loginAdmin() {
    FocusManager.instance.primaryFocus?.unfocus();

    final bool isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    context.read<AdminAuthBloc>().add(
      LoginAdminEvent(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminAuthBloc, AdminAuthState>(
      listenWhen: (previous, current) {
        return current is AdminAuthFailure;
      },
      listener: (context, state) {
        if (state is AdminAuthFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
        }
      },
      builder: (context, state) {
        final bool isLoading = state is AdminLoginLoading;

        return Scaffold(
          body: LayoutBuilder(
            builder: (context, constraints) {
              final bool isDesktop = constraints.maxWidth >= 900;

              if (isDesktop) {
                return Row(
                  children: [
                    Expanded(
                      child: LoginSection(
                        formKey: _formKey,
                        emailController: _emailController,
                        passwordController: _passwordController,
                        hidePassword: _hidePassword,
                        isLoading: isLoading,
                        onLogin: _loginAdmin,
                      ),
                    ),
                    const Expanded(child: InformationSection()),
                  ],
                );
              }

              return LoginSection(
                formKey: _formKey,
                emailController: _emailController,
                passwordController: _passwordController,
                hidePassword: _hidePassword,
                isLoading: isLoading,
                onLogin: _loginAdmin,
              );
            },
          ),
        );
      },
    );
  }
}
