import 'package:flutter/material.dart';
import 'package:your_venue_admin/core/cnostants/app_colors.dart';

class InformationSection extends StatelessWidget {
  const InformationSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 50),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.7,
                child: Image.asset(
                  'assets/images/admin login image.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const _BannerPlaceholder();
                  },
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Streamlined Venue Intelligence',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFD9E4F4),
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'Access high-fidelity data, manage complex event logistics, '
                'and secure your financial workflows with executive-level '
                'precision.',
                style: TextStyle(
                  fontSize: 14,
                  height: 1.7,
                  color: AppColors.rightDescription,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BannerPlaceholder extends StatelessWidget {
  const _BannerPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(18),
      ),
      alignment: Alignment.center,
      child: const Icon(
        Icons.admin_panel_settings_outlined,
        size: 150,
        color: Color(0xFFD9E4F4),
      ),
    );
  }
}