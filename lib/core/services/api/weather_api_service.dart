import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tianqi_forecast/core/constants/api_consts.dart';

class WeatherApiService {
  Future<dynamic> searchCity(String query, {int count = 10}) async {
    final url = Uri.parse('${ApiConsts.baseUrl}${ApiConsts.searchEndpoint}?query=$query&count=$count');

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    return _handleResponse(response);
  }

  Future<dynamic> fetchForecast({required double lat, required double lon, bool currentWeather = true}) async {
    final url = Uri.parse('${ApiConsts.baseUrl}${ApiConsts.forecastEndpoint}?latitude=$lat&longitude=$lon&current_weather=$currentWeather');

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    final data = jsonDecode(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return data;
    } else {
      throw Exception(data['message'] ?? 'API Error');
    }
  }
}