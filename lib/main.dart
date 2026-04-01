import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tianqi_forecast/core/providers/cities_provider.dart';
import 'package:tianqi_forecast/core/providers/forecast_provider.dart';
import 'package:tianqi_forecast/core/repositories/weather_repository.dart';
import 'package:tianqi_forecast/core/services/api/weather_api_service.dart';
import 'package:tianqi_forecast/core/ui/screens/auth_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) =>
              CitiesProvider(repository: WeatherRepository(apiService: WeatherApiService())),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              ForecastProvider(repository: WeatherRepository(apiService: WeatherApiService())),
        ),
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: AuthScreen());
  }
}
