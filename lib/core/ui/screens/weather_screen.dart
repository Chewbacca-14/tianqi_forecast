import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tianqi_forecast/core/providers/forecast_provider.dart';

import 'package:tianqi_forecast/core/ui/widgets/weather/weather_annotations.dart';

import 'package:tianqi_forecast/models/city.dart';



class WeatherScreen extends StatefulWidget {
  final City city;

  const WeatherScreen({
    super.key,
    required this.city,
  });

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}


class _WeatherScreenState extends State<WeatherScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;

      final forecastProvider = Provider.of<ForecastProvider>(context, listen: false);
      try {
        await forecastProvider.fetchForecast(
            lat: widget.city.latitude,
            lon: widget.city.longitude
        );

        if (mounted) {
          print("СМОТРИИИИ СЮДА ===> ${forecastProvider.suggestion}");
        }
      } catch (e) {
        if (mounted) {
          print("Ошибка загрузки: $e");
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // final forecastProvider= context.watch<ForecastProvider>();
    // forecastProvider.fetchForecast(lat:widget.city.latitude, lon:widget.city.longitude);

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
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
              ),
              color: Color(0xFFFFFFFF),
            ),
          ),
        ),
        title: Center(
          child: Column(
            children: [
              Text(
                widget.city.name,
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
        actions: [
          SizedBox(
            width: 48,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Align(
                  alignment: Alignment(0.2, 0),
                  child: Text(
                    // "${forecastProvider.suggestion?.current.temperature2m}°",
                    "",
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w800,
                      fontSize: 120,
                    ),

                  ),
                ),
                Text(
                  "WeatherIconMapper.getWeatherDescription(forecastProvider.suggestion!.current.weatherCode)"
                      .toUpperCase(),
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
                  // child: Icon(
                  //   WeatherIconMapper.getIconData(forecastProvider.suggestion.current.weatherCode),
                  //   size: 88,
                  //   color: Color(0xFF4B91E2),
                  // ),
                ),
                SizedBox(
                  height: 64,
                ),
                WeatherAnnotations(
                  name: "HUMIDITY",
                  value: "forecastProvider.suggestion?.current.relativeHumidity2m%",
                  icon: Icons.water_drop,
                  trend: Icons.trending_up,
                ),
                SizedBox(
                  height: 16,
                ),
                WeatherAnnotations(
                  name: "WIND SPEED",
                  value: "forecastProvider.suggestion?.current.windSpeed10m km/h",
                  icon: Icons.air,
                  trend: Icons.trending_flat,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
