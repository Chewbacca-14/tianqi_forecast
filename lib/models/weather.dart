class Weather {
  final String city;
  final String iconPath;
  final double windSpeed;
  final int temp;
  final int humidity;
  final String weatherAnnotation;

  const Weather({
    required this.city,
    required this.iconPath,
    required this.windSpeed,
    required this.temp,
    required this.humidity,
    required this.weatherAnnotation,
  });

  Weather copyWith({
    String? city,
    String? iconPath,
    double? windSpeed,
    int? temp,
    int? humidity,
    String? weatherAnnotation,
  }) {
    return Weather(
      city: city ?? this.city,
      iconPath: iconPath ?? this.iconPath,
      windSpeed: windSpeed ?? this.windSpeed,
      temp: temp ?? this.temp,
      humidity: humidity ?? this.humidity,
      weatherAnnotation: weatherAnnotation ?? this.weatherAnnotation,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'iconPath': iconPath,
      'windSpeed': windSpeed,
      'temp': temp,
      'humidity': humidity,
      'weatherAnnotation': weatherAnnotation,
    };
  }


  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['city'] as String,
      iconPath: json['iconPath'] as String,
      windSpeed: (json['windSpeed'] as num).toDouble(),
      temp: json['temp'] as int,
      humidity: json['humidity'] as int,
      weatherAnnotation: json['weatherAnnotation'] as String,
    );
  }

  @override
  String toString() {
    return 'Weather(city: $city, temp: $temp°C, wind: $windSpeed m/s, humidity: $humidity%, weatherAnnotation: $weatherAnnotation)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Weather &&
        other.city == city &&
        other.iconPath == iconPath &&
        other.windSpeed == windSpeed &&
        other.temp == temp &&
        other.humidity == humidity &&
        other.weatherAnnotation == weatherAnnotation;
  }

  @override
  int get hashCode {
    return city.hashCode ^
    iconPath.hashCode ^
    windSpeed.hashCode ^
    temp.hashCode ^
    humidity.hashCode ^
    weatherAnnotation.hashCode;
  }
}