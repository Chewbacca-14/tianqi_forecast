import 'package:flutter/material.dart';

class WeatherAnnotations extends StatelessWidget {
  final String name;
  final IconData icon;
  final String value;
  final IconData trend;

  const WeatherAnnotations({
    super.key,
    required this.name,
    required this.icon,
    required this.value,
    required this.trend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFF1E293B).withAlpha(100),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Color(0xFF334155).withAlpha(75)),
      ),
      height: 91,
      width: double.infinity,
      child: Row(
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: Color(0xFF4B91E2).withAlpha(50),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: Color(0xFF4B91E2),
              size: 36,
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name.toUpperCase(),
                style: TextStyle(
                  color: Color(0xFF94A3B8),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  color: Color(0xFFF1F5F9),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Spacer(),
          Icon(
            trend,
            color: Color(0xFF94A3B8),
          ),
        ],
      ),
    );
  }
}
