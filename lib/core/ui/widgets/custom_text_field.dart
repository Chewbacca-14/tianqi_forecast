import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final TextEditingController controller;
  final bool isPassword;
  final String? hintText;

  const CustomTextField({
    super.key,
    required this.controller,
    this.isPassword = false,
    this.labelText,
    this.hintText,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF0F172A).withAlpha(80),
        border: BoxBorder.all(color: Color(0xFF1E293B)),
        borderRadius: BorderRadius.circular(24),
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 17),
        child: TextFormField(
          controller: widget.controller,
          obscureText: widget.isPassword == true ? obscureText : false,
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),

          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: widget.isPassword == true
                ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Color(0xFF94A3B8),
                      size: 22,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
            )
                : null,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: Color(0xFF475569),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
