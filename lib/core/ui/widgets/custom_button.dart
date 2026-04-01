import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final FontWeight fontWeight;
  final Color color;
  final String label;
  final void Function()? onTap;

  const CustomButton({
    super.key,
    required this.fontWeight,
    required this.color,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF4B91E2), ),
      onPressed: onTap,
      child: Container(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
          // color: Color(0xFF4B91E2),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 16,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
