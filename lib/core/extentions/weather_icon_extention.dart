// lib/core/extensions/weather_icon_extensions.dart
import 'package:flutter/material.dart';

extension WeatherIconExtension on String {
  // Получить иконку по строковому пути
  IconData get weatherIcon {
    switch (this) {
      case 'sunny':
        return Icons.wb_sunny;
      case 'partly_cloudy':
        return Icons.cloud_queue;
      case 'cloudy':
        return Icons.cloud;
      case 'rain':
        return Icons.umbrella;
      case 'heavy_rain':
        return Icons.beach_access;
      case 'snow':
        return Icons.ac_unit;
      case 'thunderstorm':
        return Icons.flash_on;
      case 'foggy':
        return Icons.blur_on;
      case 'windy':
        return Icons.air;
      default:
        return Icons.cloud;
    }
  }

  // Получить цвет иконки
  Color get weatherIconColor {
    switch (this) {
      case 'sunny':
        return Colors.amber;
      case 'partly_cloudy':
        return Colors.orange;
      case 'cloudy':
        return Colors.grey;
      case 'rain':
      case 'heavy_rain':
        return Colors.blue;
      case 'snow':
        return Colors.lightBlue;
      case 'thunderstorm':
        return Colors.deepPurple;
      default:
        return Colors.grey;
    }
  }

  // Получить фоновый цвет для иконки
  Color get weatherBackgroundColor {
    switch (this) {
      case 'sunny':
        return Colors.amber.withAlpha(26);
      case 'partly_cloudy':
        return Colors.orange.withAlpha(26);
      case 'cloudy':
        return Colors.grey.withAlpha(26);
      case 'rain':
      case 'heavy_rain':
        return Colors.blue.withAlpha(26);
      case 'snow':
        return Colors.lightBlue.withAlpha(26);
      case 'thunderstorm':
        return Colors.deepPurple.withAlpha(26);
      default:
        return Colors.grey.withAlpha(26);
    }
  }
}
