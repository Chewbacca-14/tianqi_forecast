import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final TextEditingController controller;
  final double height;
  final bool obscure;
  final String? hintText;
  final Widget? prefixIcon;
  final Decoration decoration;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;

  const CustomTextField({
    required this.controller,
    required this.height,
    super.key,
    this.obscure = false,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    required this.decoration,
    this.onChanged, this.onEditingComplete,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool obscureText;
  @override
  void initState() {
    super.initState();
    obscureText = widget.obscure;
  }

  @override
  void didUpdateWidget(covariant CustomTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.obscure != widget.obscure) {
      if (!mounted) return;
      setState(() {
        obscureText = widget.obscure;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: double.infinity,
      decoration: widget.decoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 17,

        ),
        child: TextFormField(
          onChanged: widget.onChanged,
          controller: widget.controller,
          obscureText: obscureText,

          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),

          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: widget.prefixIcon,
            suffixIcon: obscureText
                ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Color(0xFF94A3B8),
                      size: 22,
                    ),
                    onPressed: () async {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },

                  )
                : null,
            suffixIconConstraints: BoxConstraints(),
            hintText: widget.hintText,

            constraints: BoxConstraints(),
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
