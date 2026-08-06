import 'package:flutter/material.dart';
import 'package:your_venue_admin/features/dashboard/view/widgets/overview_card.dart';

class OverviewCards extends StatelessWidget {
  const OverviewCards({super.key});

  @override
  Widget build(BuildContext context) {
    final cards = [
      const OverviewCardData(
        title: 'TOTAL USERS',
        value: '24,592',
        percentage: '+12.5%',
        icon: Icons.people_outline,
      ),
      const OverviewCardData(
        title: 'TOTAL MANAGERS',
        value: '1,120',
        percentage: '+4.2%',
        icon: Icons.badge_outlined,
      ),
      const OverviewCardData(
        title: 'TOTAL BOOKINGS',
        value: '12,903',
        percentage: '+18.9%',
        icon: Icons.event_available_outlined,
      ),
      const OverviewCardData(
        title: 'PENDING VERIFICATIONS',
        value: '84',
        percentage: 'Action Req.',
        icon: Icons.how_to_reg_outlined,
        requiresAction: true,
      ),
      const OverviewCardData(
        title: 'TOTAL REVENUE',
        value: '\$1,482,900',
        percentage: '+24.1%',
        icon: Icons.payments_outlined,
      ),
      const OverviewCardData(
        title: 'TOTAL TRANSACTIONS',
        value: '45,201',
        percentage: '+15.2%',
        icon: Icons.receipt_long_outlined,
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        int columnCount = 3;

        if (constraints.maxWidth < 650) {
          columnCount = 1;
        } else if (constraints.maxWidth < 1050) {
          columnCount = 2;
        }

        const spacing = 22.0;
        final width =
            (constraints.maxWidth - (spacing * (columnCount - 1))) /
            columnCount;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: cards.map((card) {
            return SizedBox(
              width: width,
              child: OverviewCard(data: card),
            );
          }).toList(),
        );
      },
    );
  }
}

class OverviewCardData {
  final String title;
  final String value;
  final String percentage;
  final IconData icon;
  final bool requiresAction;

  const OverviewCardData({
    required this.title,
    required this.value,
    required this.percentage,
    required this.icon,
    this.requiresAction = false,
  });
}