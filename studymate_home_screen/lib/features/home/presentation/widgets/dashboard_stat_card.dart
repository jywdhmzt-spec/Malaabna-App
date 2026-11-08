import 'package:flutter/material.dart';

class DashboardStatCard extends StatelessWidget {
  const DashboardStatCard({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.color,
    super.key,
  });

  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFECEEF4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              const Spacer(),
              const Icon(Icons.more_horiz, color: Color(0xFF9AA1B2)),
            ],
          ),
          const SizedBox(height: 18),
          Text(value, style: const TextStyle(
            fontSize: 26, fontWeight: FontWeight.w800, color: Color(0xFF20243A),
          )),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(
            fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF555D73),
          )),
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(
            fontSize: 11, color: Color(0xFF9299A9),
          )),
        ],
      ),
    );
  }
}
