import 'package:flutter/material.dart';

class WeatherIconMapper {
  /// Возвращает иконку для соответствующего погодного кода
  static IconData getIconData(int weatherCode) {
    switch (weatherCode) {
    // Ясно
      case 0:
        return Icons.wb_sunny;

    // Облачно
      case 1:
      case 2:
      case 3:
        return Icons.wb_cloudy;

    // Туман
      case 45:
      case 48:
        return Icons.blur_on;

    // Морось
      case 51:
      case 53:
      case 55:
        return Icons.grain;

    // Морось замерзающая
      case 56:
      case 57:
        return Icons.ac_unit;

    // Дождь
      case 61:
      case 63:
      case 65:
        return Icons.umbrella;

    // Ледяной дождь
      case 66:
      case 67:
        return Icons.ac_unit;

    // Снег
      case 71:
      case 73:
      case 75:
        return Icons.ac_unit;

    // Снежные зерна
      case 77:
        return Icons.grain;

    // Ливни
      case 80:
      case 81:
      case 82:
        return Icons.umbrella;

    // Снегопады
      case 85:
      case 86:
        return Icons.ac_unit;

    // Гроза
      case 95:
        return Icons.flash_on;

    // Гроза с градом
      case 96:
      case 99:
        return Icons.flash_on;

    // По умолчанию
      default:
        return Icons.help_outline;
    }
  }

  /// Возвращает текстовое описание погоды по коду
  static String getWeatherDescription(int weatherCode) {
    switch (weatherCode) {
      case 0:
        return 'Ясно';
      case 1:
        return 'Преимущественно ясно';
      case 2:
        return 'Переменная облачность';
      case 3:
        return 'Пасмурно';
      case 45:
        return 'Туман';
      case 48:
        return 'Туман с изморозью';
      case 51:
        return 'Легкая морось';
      case 53:
        return 'Умеренная морось';
      case 55:
        return 'Сильная морось';
      case 56:
        return 'Легкая замерзающая морось';
      case 57:
        return 'Сильная замерзающая морось';
      case 61:
        return 'Небольшой дождь';
      case 63:
        return 'Умеренный дождь';
      case 65:
        return 'Сильный дождь';
      case 66:
        return 'Легкий ледяной дождь';
      case 67:
        return 'Сильный ледяной дождь';
      case 71:
        return 'Небольшой снег';
      case 73:
        return 'Умеренный снег';
      case 75:
        return 'Сильный снег';
      case 77:
        return 'Снежные зерна';
      case 80:
        return 'Легкий ливень';
      case 81:
        return 'Умеренный ливень';
      case 82:
        return 'Сильный ливень';
      case 85:
        return 'Небольшой снегопад';
      case 86:
        return 'Сильный снегопад';
      case 95:
        return 'Гроза';
      case 96:
        return 'Гроза с небольшим градом';
      case 99:
        return 'Гроза с сильным градом';
      default:
        return 'Неизвестно';
    }
  }

  /// Возвращает цвет иконки в зависимости от погоды
  static Color getIconColor(int weatherCode) {
    if (weatherCode == 0) {
      return Colors.amber; // Солнечно
    } else if (weatherCode >= 1 && weatherCode <= 3) {
      return Colors.grey; // Облачно
    } else if (weatherCode >= 45 && weatherCode <= 99) {
      return Colors.blue; // Осадки
    } else {
      return Colors.grey;
    }
  }
}