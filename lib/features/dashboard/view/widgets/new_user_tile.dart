import 'package:flutter/material.dart';
import 'package:your_venue_admin/core/cnostants/app_colors.dart';

class NewUserTile extends StatelessWidget {
  final String initials;
  final String name;
  final String email;
  final String registeredTime;
  final Color avatarColor;

  const NewUserTile({
    super.key,
    required this.initials,
    required this.name,
    required this.email,
    required this.registeredTime,
    required this.avatarColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 70),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE8EAED)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 23,
            backgroundColor: avatarColor,
            child: Text(
              initials,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  email,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF626974),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'REGISTERED',
                style: TextStyle(fontSize: 8, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 3),
              Text(registeredTime, style: const TextStyle(fontSize: 11)),
            ],
          ),
        ],
      ),
    );
  }
}