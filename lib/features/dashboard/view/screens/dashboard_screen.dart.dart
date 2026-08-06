import 'package:flutter/material.dart';
import 'package:your_venue_admin/core/cnostants/app_colors.dart';
import 'package:your_venue_admin/features/dashboard/view/widgets/dashboard_header.dart';
import 'package:your_venue_admin/features/dashboard/view/widgets/dashboard_top_bar.dart';
import 'package:your_venue_admin/features/dashboard/view/widgets/manager_application_card.dart';
import 'package:your_venue_admin/features/dashboard/view/widgets/new_user_card.dart';
import 'package:your_venue_admin/features/dashboard/view/widgets/overview_section.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  // static const Color primaryColor = Color(0xFF082D57);
  // static const Color sidebarColor = Color(0xFF172538);
  // static const Color accentColor = Color(0xFF9A7300);
  // static const Color backgroundColor = Color(0xFFF4F6F9);

  @override
  Widget build(BuildContext context) {
    final bool showSidebar = MediaQuery.sizeOf(context).width >= 900;

    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: showSidebar ? null : const Drawer(child: DashboardSidebar()),
      body: Row(
        children: [
          if (showSidebar)
            const SizedBox(width: 250, child: DashboardSidebar()),
          const Expanded(
            child: Column(
              children: [
                DashboardTopBar(),
                Expanded(child: DashboardContent()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Sidebar
// -----------------------------------------------------------------------------

class DashboardSidebar extends StatelessWidget {
  const DashboardSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(22, 22, 16, 28),
              child: Row(
                children: [
                  _LogoBox(),
                  SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Venue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Enterprise Suite',
                        style: TextStyle(
                          color: Color(0xFF9DA8B8),
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const DashboardMenuItem(
              icon: Icons.dashboard_outlined,
              title: 'Dashboard',
              selected: true,
            ),
            const DashboardMenuItem(
              icon: Icons.business_center_outlined,
              title: 'Managers',
            ),
            const DashboardMenuItem(icon: Icons.people_outline, title: 'Users'),
            const DashboardMenuItem(
              icon: Icons.event_available_outlined,
              title: 'Bookings',
            ),
            const DashboardMenuItem(
              icon: Icons.payments_outlined,
              title: 'Revenue',
            ),
            const DashboardMenuItem(
              icon: Icons.layers_outlined,
              title: 'Amenities',
            ),
            const DashboardMenuItem(
              icon: Icons.rate_review_outlined,
              title: 'Reviews',
            ),
            const DashboardMenuItem(
              icon: Icons.notifications_none,
              title: 'Notifications',
            ),
            const Spacer(),
            const DashboardMenuItem(
              icon: Icons.settings_outlined,
              title: 'Settings',
            ),
            const DashboardMenuItem(icon: Icons.help_outline, title: 'Support'),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

class _LogoBox extends StatelessWidget {
  const _LogoBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFF344258),
        borderRadius: BorderRadius.circular(7),
      ),
      child: const Icon(Icons.apartment, color: AppColors.secondary, size: 23),
    );
  }
}

class DashboardMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool selected;

  const DashboardMenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Material(
        color: selected ? const Color(0xFF223248) : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: () {},
          child: Container(
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 21,
                  color: selected ? Colors.white : const Color(0xFFB6BFCC),
                ),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                    color: selected ? Colors.white : const Color(0xFFB6BFCC),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Dashboard content
// -----------------------------------------------------------------------------

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1400),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DashboardHeader(),
              SizedBox(height: 28),
              OverviewCards(),
              SizedBox(height: 36),
              DashboardBottomSection(),
            ],
          ),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Bottom section
// -----------------------------------------------------------------------------

class DashboardBottomSection extends StatelessWidget {
  const DashboardBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 950) {
          return const Column(
            children: [
              ManagerApplicationsCard(),
              SizedBox(height: 22),
              NewUsersCard(),
            ],
          );
        }

        return const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: ManagerApplicationsCard()),
            SizedBox(width: 22),
            Expanded(child: NewUsersCard()),
          ],
        );
      },
    );
  }
}
