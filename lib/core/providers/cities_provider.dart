import 'package:flutter/material.dart';
import 'package:tianqi_forecast/core/repositories/weather_repository.dart';
import 'package:tianqi_forecast/models/city.dart';

class CitiesProvider extends ChangeNotifier {
  final WeatherRepository repository;

  CitiesProvider({required this.repository});

  List<City> city = [];
  City? selectedCity;

  bool isLoading = false;

  String? error;

  Future<void> searchCity(String query, {int count = 10}) async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      city = await repository.searchCity(query, count: count);
      print(city);
    } catch (e) {
      city.clear();
      error = e.toString();
      print(e);
    }

    isLoading = false;
    notifyListeners();
  }
  void selectCity(City city) {
    selectedCity = city;
    notifyListeners();
  }


}

