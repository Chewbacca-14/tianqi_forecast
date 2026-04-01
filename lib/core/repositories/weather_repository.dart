import 'package:tianqi_forecast/core/services/api/weather_api_service.dart';
import 'package:tianqi_forecast/models/city.dart';
import 'package:tianqi_forecast/models/weather_model.dart';

class WeatherRepository {
  final WeatherApiService apiService;

  WeatherRepository({required this.apiService});

  Future<List<City>> searchCity(String query, {int count = 10}) async {
    final res = await apiService.searchCity(query, count: count);
    return (res['results'] as List<dynamic>).map((e) => City.fromJson(e)).toList();
  }

  Future<WeatherModel> fetchForecast({
    required double lat,
    required double lon,
  }) async {
    final res = await apiService.fetchForecast(
      lat: lat,
      lon: lon,
    );
    return WeatherModel.fromJson(res);
  }
}
