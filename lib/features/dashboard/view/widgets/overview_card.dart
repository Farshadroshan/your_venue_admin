import 'package:flutter/material.dart';
import 'package:your_venue_admin/core/cnostants/app_colors.dart';
import 'package:your_venue_admin/features/dashboard/view/widgets/overview_section.dart';

class OverviewCard extends StatelessWidget {
  final OverviewCardData data;

  const OverviewCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final Color statusColor = data.requiresAction
        ? AppColors.secondary
        : const Color(0xFF12A94F);

    return Container(
      height: 155,
      padding: const EdgeInsets.all(23),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: const Color(0xFFE3E7EC)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                color: data.requiresAction
                    ? const Color(0xFFFFF8E6)
                    : const Color(0xFFF2F5F8),
                child: Icon(
                  data.icon,
                  color: data.requiresAction
                      ? AppColors.secondary
                      : AppColors.primary,
                  size: 22,
                ),
              ),
              const Spacer(),
              Text(
                data.percentage,
                style: TextStyle(
                  color: statusColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (!data.requiresAction) ...[
                const SizedBox(width: 4),
                Icon(Icons.trending_up, color: statusColor, size: 15),
              ],
            ],
          ),
          const Spacer(),
          Text(
            data.title,
            style: const TextStyle(
              color: Color(0xFF4A505B),
              fontSize: 11,
              letterSpacing: 0.4,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            data.value,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}