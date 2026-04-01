import 'package:flutter/material.dart';
import 'package:tianqi_forecast/core/repositories/weather_repository.dart';
import 'package:tianqi_forecast/models/weather_model.dart';

class ForecastProvider extends ChangeNotifier {
  final WeatherRepository repository;

  ForecastProvider({required this.repository});

  bool isLoading = false;

  String? error;
  WeatherModel? suggestion;

  Future<void> fetchForecast({
    required double lat,
    required double lon,
  }) async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      suggestion = await repository.fetchForecast(lat: lat, lon: lon);
      print(suggestion);
    } catch (e) {
      error = e.toString();
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}
