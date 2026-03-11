import 'package:flutter/material.dart';

class CompactColorSwitch extends StatefulWidget {
  final bool initialValue;
  final Color lightColor;
  final Color darkColor;
  final ValueChanged<bool>? onChanged;

  const CompactColorSwitch({
    Key? key,
    this.initialValue = false,
    required this.lightColor,
    required this.darkColor ,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CompactColorSwitch> createState() => _CompactColorSwitchState();
}

class _CompactColorSwitchState extends State<CompactColorSwitch> {
  late bool _isDark;

  @override
  void initState() {
    super.initState();
    _isDark = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            _isDark ? widget.darkColor : widget.lightColor,
            (_isDark ? widget.darkColor : widget.lightColor).withOpacity(0.7),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Иконка темы
          Icon(
            _isDark ? Icons.nightlight_round : Icons.wb_sunny,
            color: _isDark ? Colors.white : Colors.amber,
            size: 32,
          ),

          const SizedBox(height: 8),

          // Название темы
          Text(
            _isDark ? 'Темная тема' : 'Светлая тема',
            style: TextStyle(
              color: _isDark ? Colors.white : Color(0xFF121820),
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 12),

          // Переключатель
          Switch(
            value: _isDark,
            onChanged: (value) {
              setState(() {
                _isDark = value;
                widget.onChanged?.call(_isDark);
              });
            },
            activeColor: Colors.white,
            activeTrackColor: Colors.blue,
            inactiveThumbColor: Colors.blue,
            inactiveTrackColor: Colors.grey[300],
          ),
        ],
      ),
    );
  }
}