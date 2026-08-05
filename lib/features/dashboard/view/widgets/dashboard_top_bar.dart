import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_venue_admin/core/cnostants/app_colors.dart';
import 'package:your_venue_admin/features/authentication/view_modes/bloc/admin_auth_bloc/admin_auth_bloc.dart';

class DashboardTopBar extends StatelessWidget {
  const DashboardTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.sizeOf(context).width < 900;

    return Container(
      height: 65,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        color: Color(0xFFF9FAFC),
        border: Border(bottom: BorderSide(color: Color(0xFFD8DDE5))),
      ),
      child: Row(
        children: [
          if (isMobile) ...[
            Builder(
              builder: (context) => IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: const Icon(Icons.menu),
              ),
            ),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search data, reports, and users...',
                  hintStyle: TextStyle(fontSize: 13),
                  prefixIcon: Icon(Icons.search, size: 21),
                  filled: true,
                  fillColor: Color(0xFFF8F9FB),
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCBD1DA)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          IconButton(
            tooltip: 'Notifications',
            onPressed: () {},
            icon: const Badge(
              smallSize: 7,
              child: Icon(Icons.notifications_none, color: AppColors.primary),
            ),
          ),
          IconButton(
            tooltip: 'Help',
            onPressed: () {},
            icon: const Icon(Icons.help_outline, color: AppColors.primary),
          ),
          if (!isMobile) ...[
            const SizedBox(width: 10),
            Container(height: 32, width: 1, color: const Color(0xFFD1D6DE)),
            const SizedBox(width: 20),
            BlocBuilder<AdminAuthBloc, AdminAuthState>(
              builder: (context, state) {
                final bool isLoggingOut = state is AdminLogoutLoading;

                return TextButton.icon(
                  onPressed: isLoggingOut
                      ? null
                      : () {
                          context.read<AdminAuthBloc>().add(
                            const LogoutAdminEvent(),
                          );
                        },
                  icon: isLoggingOut
                      ? const SizedBox(
                          width: 17,
                          height: 17,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.primary,
                          ),
                        )
                      : const Icon(
                          Icons.logout,
                          color: AppColors.primary,
                          size: 19,
                        ),
                  label: Text(
                    isLoggingOut ? 'Logging out...' : 'Logout',
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              },
            ),
          ],
        ],
      ),
    );
  }
}