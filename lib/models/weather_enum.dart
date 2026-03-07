import 'package:tianqi_forecast/models/weather.dart';

enum WeatherEnum {
  prague(
    city: 'Prague',
    iconPath: 'partly_cloudy',
    windSpeed: 4.2,
    temp: 17,
    humidity: 72,
    weatherAnnotation: 'Partly cloudy',
  ),
  london(
    city: 'London',
    iconPath: 'rainy',
    windSpeed: 6.8,
    temp: 12,
    humidity: 85,
    weatherAnnotation: 'Light rain',
  ),
  tokyo(
    city: 'Tokyo',
    iconPath: 'sunny',
    windSpeed: 3.5,
    temp: 24,
    humidity: 60,
    weatherAnnotation: 'Sunny',
  ),
  newYork(
    city: 'New York',
    iconPath: 'cloudy',
    windSpeed: 5.1,
    temp: 15,
    humidity: 78,
    weatherAnnotation: 'Cloudy',
  );

  final String city;
  final String iconPath;
  final double windSpeed;
  final int temp;
  final int humidity;
  final String weatherAnnotation;

  const WeatherEnum({
    required this.city,
    required this.iconPath,
    required this.windSpeed,
    required this.temp,
    required this.humidity,
    required this.weatherAnnotation,
  });

  Weather toWeather() {
    return Weather(
      city: city,
      iconPath: iconPath,
      windSpeed: windSpeed,
      temp: temp,
      humidity: humidity,
      weatherAnnotation: weatherAnnotation,
    );
  }

  static List<Weather> getAllWeatherModels() {
    return WeatherEnum.values.map((enumValue) => enumValue.toWeather()).toList();
  }
}
