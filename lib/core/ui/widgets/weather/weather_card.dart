import 'package:flutter/material.dart';

class WeatherCard extends StatefulWidget {
  final String city;
  final String weatherAnnotation;
  final Widget weatherIcon;
  final int temperature;
  final void Function()? onTap;

  const WeatherCard({
    super.key,
    required this.city,
    required this.weatherIcon,
    required this.weatherAnnotation,
    required this.temperature,
    this.onTap,
  });

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Color(0xFF1E293B).withAlpha(100),
          border: BoxBorder.all(color: Color(0xFF334155).withAlpha(127)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Current location".toUpperCase(),
                    style: TextStyle(
                      color: Color(0xFF4B91E2),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    widget.city,
                    style: TextStyle(
                      color: Color(0xFFF1F5F9),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    children: [
                      widget.weatherIcon,
                      Text(
                        widget.weatherAnnotation,
                        style: TextStyle(
                          color: Color(0xFF94A3B8),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Text(
                "${widget.temperature} °",
                style: TextStyle(
                  color: Color(0xFFF1F5F9),
                  fontSize: 48,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
