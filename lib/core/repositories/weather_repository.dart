import 'package:tianqi_forecast/core/services/api/weather_api_service.dart';
import 'package:tianqi_forecast/models/weather.dart';

class WeatherRepository {
  final WeatherApiService apiService;

  WeatherRepository({required this.apiService});

  Future<List<Weather>> searchCity(String query, {int count = 10}) async {
    final res = await apiService.searchCity(query, count: count);
    return (res['results'] as List<dynamic>).map((e) => Weather.fromJson(e)).toList();
  }

  Future<Weather> fetchForecast({
    required double lat,
    required double lon,
    bool currentWeather = true,
  }) async {
    final res = await apiService.fetchForecast(
      lat: lat,
      lon: lon,
      currentWeather: currentWeather,
    );
    return Weather.fromJson(res);
  }
}
