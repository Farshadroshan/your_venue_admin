import 'package:flutter/material.dart';
import 'package:your_venue_admin/core/cnostants/app_colors.dart';

class AdminLogoSection extends StatelessWidget {
  const AdminLogoSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Icon(
                Icons.home_work_outlined,
                size: 46,
                color: AppColors.primary,
              ),
              Positioned(
                right: 6,
                bottom: 8,
                child: Container(
                  width: 7,
                  height: 18,
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Your Venue Admin',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          'Management Portal',
          style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
        ),
      ],
    );
  }
}