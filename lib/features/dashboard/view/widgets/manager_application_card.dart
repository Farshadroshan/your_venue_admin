import 'package:flutter/material.dart';
import 'package:your_venue_admin/core/cnostants/app_colors.dart';
import 'package:your_venue_admin/features/dashboard/view/widgets/dashboard_section_card.dart';

class ManagerApplicationsCard extends StatelessWidget {
  const ManagerApplicationsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardSectionCard(
      title: 'Manager Applications',
      actionText: 'View All',
      child: Column(
        children: [
          const _ManagerTableHeader(),
          _ManagerRow(
            initials: 'MS',
            name: 'Marcus Sterling',
            date: 'Oct 24,\n2023',
            status: 'PENDING',
            action: 'Review',
          ),
          _ManagerRow(
            initials: 'EW',
            name: 'Elena Wright',
            date: 'Oct 23,\n2023',
            status: 'VERIFIED',
            action: 'Manage',
            highlighted: true,
          ),
          _ManagerRow(
            initials: 'RJ',
            name: 'Robert Jenkins',
            date: 'Oct 22,\n2023',
            status: 'PENDING',
            action: 'Review',
          ),
        ],
      ),
    );
  }
}



class _ManagerTableHeader extends StatelessWidget {
  const _ManagerTableHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 22),
      color: const Color(0xFFF1F3F6),
      child: const Row(
        children: [
          Expanded(flex: 4, child: Text('NAME', style: _tableHeaderStyle)),
          Expanded(flex: 2, child: Text('DATE', style: _tableHeaderStyle)),
          Expanded(flex: 3, child: Text('STATUS', style: _tableHeaderStyle)),
          Expanded(flex: 2, child: Text('ACTION', style: _tableHeaderStyle)),
        ],
      ),
    );
  }
}

const TextStyle _tableHeaderStyle = TextStyle(
  fontSize: 10,
  color: Color(0xFF555B65),
  fontWeight: FontWeight.w700,
  letterSpacing: 0.7,
);

class _ManagerRow extends StatelessWidget {
  final String initials;
  final String name;
  final String date;
  final String status;
  final String action;
  final bool highlighted;

  const _ManagerRow({
    required this.initials,
    required this.name,
    required this.date,
    required this.status,
    required this.action,
    this.highlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool verified = status == 'VERIFIED';

    return Container(
      constraints: const BoxConstraints(minHeight: 72),
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      color: highlighted ? const Color(0xFFF7F8FA) : Colors.white,
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 14,
                  backgroundColor: const Color(0xFFFFE9AB),
                  child: Text(
                    initials,
                    style: const TextStyle(
                      color: AppColors.secondary,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(name, style: const TextStyle(fontSize: 12)),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              date,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF555B65),
                height: 1.4,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: verified
                      ? const Color(0xFFDBF4E3)
                      : const Color(0xFFFFE9A9),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: verified
                        ? const Color(0xFF16823C)
                        : const Color(0xFF926D00),
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: TextButton(
              onPressed: () {},
              child: Text(
                action,
                style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// class DashboardSectionCard extends StatelessWidget {
//   final String title;
//   final String actionText;
//   final Widget child;

//   const DashboardSectionCard({
//     super.key,
//     required this.title,
//     required this.actionText,
//     required this.child,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       clipBehavior: Clip.antiAlias,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(11),
//         border: Border.all(color: const Color(0xFFE1E5EA)),
//         boxShadow: const [
//           BoxShadow(
//             color: Color(0x0D000000),
//             blurRadius: 12,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           Container(
//             height: 58,
//             padding: const EdgeInsets.symmetric(horizontal: 22),
//             decoration: const BoxDecoration(
//               border: Border(bottom: BorderSide(color: Color(0xFFD9DEE5))),
//             ),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Text(
//                     title,
//                     style: const TextStyle(
//                       color: AppColors.primary,
//                       fontSize: 17,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () {},
//                   child: Text(
//                     actionText,
//                     style: const TextStyle(
//                       color: AppColors.secondary,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           child,
//         ],
//       ),
//     );
//   }
// }