import 'package:flutter/material.dart';

class QuickCreateSheet extends StatelessWidget {
  const QuickCreateSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => const QuickCreateSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final actions = <(IconData, String, Color)>[
      (Icons.check_circle_outline, 'مهمة جديدة', const Color(0xFF5B6CDE)),
      (Icons.edit_note, 'ملاحظة سريعة', const Color(0xFF16A085)),
      (Icons.description_outlined, 'ملاحظة كاملة', const Color(0xFFE39A35)),
      (Icons.menu_book_outlined, 'مادة جديدة', const Color(0xFF9872D8)),
    ];

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 42, height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFDDE0E8),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerRight,
              child: Text('إنشاء سريع', style: TextStyle(
                fontSize: 19, fontWeight: FontWeight.w800,
              )),
            ),
            const SizedBox(height: 14),
            ...actions.map((action) => ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundColor: action.$3.withOpacity(0.10),
                child: Icon(action.$1, color: action.$3),
              ),
              title: Text(action.$2, style: const TextStyle(
                fontWeight: FontWeight.w600,
              )),
              trailing: const Icon(Icons.chevron_left),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('سيتم إعداد خيار «${action.$2}» لاحقاً')),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
