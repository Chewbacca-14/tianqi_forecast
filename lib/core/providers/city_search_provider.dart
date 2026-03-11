import 'package:flutter/material.dart';
import 'package:tianqi_forecast/core/repositories/weather_repository.dart';
import 'package:tianqi_forecast/models/weather.dart';

class CitySearchProvider extends ChangeNotifier {
  final WeatherRepository repository;
  CitySearchProvider({required this.repository});

  List<Weather> suggestions = [];

  bool isLoading = false;

  String? error;

  Future<void> searchCity(String query, {int count = 10}) async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      suggestions = await repository.searchCity(query, count: count);
    } catch (e) {
      suggestions.clear();
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
