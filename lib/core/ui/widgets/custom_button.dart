import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final String label;
  final void Function()? onTap;
  final Gradient? backgroundGradient;
  final Color? backgroundColor;
  final List<BoxShadow>? boxShadow;

  const CustomButton({
    super.key,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
    required this.label,
    this.onTap,
    this.backgroundGradient,
    this.backgroundColor,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    const defaultGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF60A5FA),
        Color(0xFF2563EB),
      ],
    );

    final effectiveGradient =
        backgroundGradient ?? (backgroundColor == null ? defaultGradient : null);
    final effectiveColor =
        backgroundColor ?? (effectiveGradient == null ? const Color(0xFF4B91E2) : null);

    final effectiveShadow =
        boxShadow ??
        [
          BoxShadow(
            color: const Color(0xFF2563EB).withAlpha(82),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ];

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Ink(
          height: 56,
          width: double.infinity,
          decoration: BoxDecoration(
            color: effectiveColor,
            gradient: effectiveGradient,
            borderRadius: BorderRadius.circular(24),
            boxShadow: effectiveShadow,
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: fontSize,
                fontWeight: fontWeight,
                letterSpacing: 0.2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
