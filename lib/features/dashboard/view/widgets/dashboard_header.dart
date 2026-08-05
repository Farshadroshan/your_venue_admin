import 'package:flutter/material.dart';
import 'package:your_venue_admin/core/cnostants/app_colors.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final bool useColumn = MediaQuery.sizeOf(context).width < 700;

    final title = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'System Overview',
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          'Real-time venue management performance metrics.',
          style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
        ),
      ],
    );

    const buttons = Wrap(
      spacing: 12,
      runSpacing: 10,
      children: [_ExportButton(), _RefreshButton()],
    );

    if (useColumn) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [title, const SizedBox(height: 18), buttons],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [title, buttons],
    );
  }
}

class _ExportButton extends StatelessWidget {
  const _ExportButton();

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.download_outlined, size: 17),
      label: const Text('Export Report'),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 17),
        side: const BorderSide(color: Color(0xFFC9D0DA)),
        shape: const RoundedRectangleBorder(),
      ),
    );
  }
}


class _RefreshButton extends StatelessWidget {
  const _RefreshButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
        elevation: 0,
        shape: const RoundedRectangleBorder(),
      ),
      child: const Text('Refresh Data'),
    );
  }
}