import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tianqi_forecast/core/ui/widgets/weather/weather_annotations.dart';


class WeatherScreen extends StatelessWidget {
  final String city;
  final int temperature;
  final String weatherAnnotation;
  final IconData weatherIcon;

  const WeatherScreen({
    super.key,
    required this.city,
    required this.temperature,
    required this.weatherAnnotation,
    required this.weatherIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121820),
      appBar: AppBar(
        backgroundColor: Color(0xFF121820),
        centerTitle: true,
        leadingWidth: 75,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Color(0xFF1E293B).withAlpha(127),
            ),
            child: IconButton(
              onPressed: (){Navigator.pop(context);},
              icon: Icon(Icons.arrow_back,),
              color: Color(0xFFFFFFFF),
            ),
          ),
        ),
        title: Center(
          child: Column(
            children: [
              Text(
                city,
                style: TextStyle(
                  color: Color(0xFFF1F5F9),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.45,
                ),
              ),
              Text(
                DateFormat('EEEE, d MMMM').format(DateTime.now()).toString(),
                style: TextStyle(
                  color: Color(0xFF94A3B8),
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        actions: [SizedBox(width: 48,)],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Center(
          child: Column(
            children: [
              Text(
                " $temperature°",
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.w800,
                  fontSize: 120,
                ),
              ),
              Text(
                weatherAnnotation.toUpperCase(),
                style: TextStyle(
                  letterSpacing: 4,
                  color: Color(0xFF4B91E2),
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 64,
              ),
              Container(
                height: 192,
                width: 192,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color(0xFF4B91E2).withAlpha(55),
                  border: Border.all(
                    color: Color(0xFF4B91E2).withAlpha(13),
                  ),
                ),
                child: Icon(
                  weatherIcon,
                  size: 88,
                  color: Color(0xFF4B91E2),
                ),
              ),
              SizedBox(
                height: 64,
              ),
              WeatherAnnotations(
                name: "HUMIDITY",
                value: '64%',
                icon: Icons.water_drop,
                trend: Icons.trending_up,
              ),
              SizedBox(height: 16,),
              WeatherAnnotations(
                name: "WIND SPEED",
                value: '12 km/h',
                icon: Icons.air,
                trend: Icons.trending_flat,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
