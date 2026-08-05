import 'package:flutter/material.dart';
import 'package:your_venue_admin/features/dashboard/view/widgets/dashboard_section_card.dart';
import 'package:your_venue_admin/features/dashboard/view/widgets/new_user_tile.dart';

class NewUsersCard extends StatelessWidget {
  const NewUsersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardSectionCard(
      title: 'New Users',
      actionText: 'Full Directory',
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            NewUserTile(
              initials: 'AM',
              name: 'Arthur Morgan',
              email: 'arthur.m@outlook.com',
              registeredTime: '2 Hours Ago',
              avatarColor: Color(0xFF607D8B),
            ),
            SizedBox(height: 14),
            NewUserTile(
              initials: 'LV',
              name: 'Lillian Vance',
              email: 'lvance@startup.io',
              registeredTime: '5 Hours Ago',
              avatarColor: Color(0xFF8D6E63),
            ),
            SizedBox(height: 14),
            NewUserTile(
              initials: 'DK',
              name: 'David Kim',
              email: 'dkim.ux@design.co',
              registeredTime: 'Yesterday',
              avatarColor: Color(0xFF455A64),
            ),
          ],
        ),
      ),
    );
  }
}