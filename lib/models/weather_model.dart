class WeatherModel implements Comparable<WeatherModel> {
  final double latitude;
  final double longitude;
  final double generationtimeMs;
  final int utcOffsetSeconds;
  final String timezone;
  final String timezoneAbbreviation;
  final double elevation;
  final CurrentUnits currentUnits;
  final CurrentWeather current;

  const WeatherModel({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.currentUnits,
    required this.current,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      generationtimeMs: (json['generationtime_ms'] as num).toDouble(),
      utcOffsetSeconds: json['utc_offset_seconds'] as int,
      timezone: json['timezone'] as String,
      timezoneAbbreviation: json['timezone_abbreviation'] as String,
      elevation: (json['elevation'] as num).toDouble(),
      currentUnits: CurrentUnits.fromJson(json['current_units']),
      current: CurrentWeather.fromJson(json['current']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'generationtime_ms': generationtimeMs,
      'utc_offset_seconds': utcOffsetSeconds,
      'timezone': timezone,
      'timezone_abbreviation': timezoneAbbreviation,
      'elevation': elevation,
      'current_units': currentUnits.toJson(),
      'current': current.toJson(),
    };
  }

  WeatherModel copyWith({
    double? latitude,
    double? longitude,
    double? generationtimeMs,
    int? utcOffsetSeconds,
    String? timezone,
    String? timezoneAbbreviation,
    double? elevation,
    CurrentUnits? currentUnits,
    CurrentWeather? current,
  }) {
    return WeatherModel(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      generationtimeMs: generationtimeMs ?? this.generationtimeMs,
      utcOffsetSeconds: utcOffsetSeconds ?? this.utcOffsetSeconds,
      timezone: timezone ?? this.timezone,
      timezoneAbbreviation: timezoneAbbreviation ?? this.timezoneAbbreviation,
      elevation: elevation ?? this.elevation,
      currentUnits: currentUnits ?? this.currentUnits,
      current: current ?? this.current,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WeatherModel &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.generationtimeMs == generationtimeMs &&
        other.utcOffsetSeconds == utcOffsetSeconds &&
        other.timezone == timezone &&
        other.timezoneAbbreviation == timezoneAbbreviation &&
        other.elevation == elevation &&
        other.currentUnits == currentUnits &&
        other.current == current;
  }

  @override
  int get hashCode {
    return Object.hash(
      latitude,
      longitude,
      generationtimeMs,
      utcOffsetSeconds,
      timezone,
      timezoneAbbreviation,
      elevation,
      currentUnits,
      current,
    );
  }

  @override
  String toString() {
    return 'WeatherModel(latitude: $latitude, longitude: $longitude, '
        'generationtimeMs: $generationtimeMs, utcOffsetSeconds: $utcOffsetSeconds, '
        'timezone: $timezone, timezoneAbbreviation: $timezoneAbbreviation, '
        'elevation: $elevation, currentUnits: $currentUnits, current: $current)';
  }

  @override
  int compareTo(WeatherModel other) {
    // Сравниваем по времени (более позднее время считается больше)
    return current.time.compareTo(other.current.time);
  }
}

class CurrentUnits implements Comparable<CurrentUnits> {
  final String time;
  final String interval;
  final String temperature2m;
  final String relativeHumidity2m;
  final String windSpeed10m;
  final String weatherCode;

  const CurrentUnits({
    required this.time,
    required this.interval,
    required this.temperature2m,
    required this.relativeHumidity2m,
    required this.windSpeed10m,
    required this.weatherCode,
  });

  factory CurrentUnits.fromJson(Map<String, dynamic> json) {
    return CurrentUnits(
      time: json['time'] as String,
      interval: json['interval'] as String,
      temperature2m: json['temperature_2m'] as String,
      relativeHumidity2m: json['relative_humidity_2m'] as String,
      windSpeed10m: json['wind_speed_10m'] as String,
      weatherCode: json['weather_code'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'interval': interval,
      'temperature_2m': temperature2m,
      'relative_humidity_2m': relativeHumidity2m,
      'wind_speed_10m': windSpeed10m,
      'weather_code': weatherCode,
    };
  }

  CurrentUnits copyWith({
    String? time,
    String? interval,
    String? temperature2m,
    String? relativeHumidity2m,
    String? windSpeed10m,
    String? weatherCode,
  }) {
    return CurrentUnits(
      time: time ?? this.time,
      interval: interval ?? this.interval,
      temperature2m: temperature2m ?? this.temperature2m,
      relativeHumidity2m: relativeHumidity2m ?? this.relativeHumidity2m,
      windSpeed10m: windSpeed10m ?? this.windSpeed10m,
      weatherCode: weatherCode ?? this.weatherCode,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CurrentUnits &&
        other.time == time &&
        other.interval == interval &&
        other.temperature2m == temperature2m &&
        other.relativeHumidity2m == relativeHumidity2m &&
        other.windSpeed10m == windSpeed10m &&
        other.weatherCode == weatherCode;
  }

  @override
  int get hashCode {
    return Object.hash(
      time,
      interval,
      temperature2m,
      relativeHumidity2m,
      windSpeed10m,
      weatherCode,
    );
  }

  @override
  String toString() {
    return 'CurrentUnits(time: $time, interval: $interval, '
        'temperature2m: $temperature2m, relativeHumidity2m: $relativeHumidity2m, '
        'windSpeed10m: $windSpeed10m, weatherCode: $weatherCode)';
  }

  @override
  int compareTo(CurrentUnits other) {
    // Сравниваем по названию единицы измерения температуры
    return temperature2m.compareTo(other.temperature2m);
  }
}

class CurrentWeather implements Comparable<CurrentWeather> {
  final String time;
  final int interval;
  final double temperature2m;
  final int relativeHumidity2m;
  final double windSpeed10m;
  final int weatherCode;

  const CurrentWeather({
    required this.time,
    required this.interval,
    required this.temperature2m,
    required this.relativeHumidity2m,
    required this.windSpeed10m,
    required this.weatherCode,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      time: json['time'] as String,
      interval: json['interval'] as int,
      temperature2m: (json['temperature_2m'] as num).toDouble(),
      relativeHumidity2m: json['relative_humidity_2m'] as int,
      windSpeed10m: (json['wind_speed_10m'] as num).toDouble(),
      weatherCode: json['weather_code'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'interval': interval,
      'temperature_2m': temperature2m,
      'relative_humidity_2m': relativeHumidity2m,
      'wind_speed_10m': windSpeed10m,
      'weather_code': weatherCode,
    };
  }

  CurrentWeather copyWith({
    String? time,
    int? interval,
    double? temperature2m,
    int? relativeHumidity2m,
    double? windSpeed10m,
    int? weatherCode,
  }) {
    return CurrentWeather(
      time: time ?? this.time,
      interval: interval ?? this.interval,
      temperature2m: temperature2m ?? this.temperature2m,
      relativeHumidity2m: relativeHumidity2m ?? this.relativeHumidity2m,
      windSpeed10m: windSpeed10m ?? this.windSpeed10m,
      weatherCode: weatherCode ?? this.weatherCode,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CurrentWeather &&
        other.time == time &&
        other.interval == interval &&
        other.temperature2m == temperature2m &&
        other.relativeHumidity2m == relativeHumidity2m &&
        other.windSpeed10m == windSpeed10m &&
        other.weatherCode == weatherCode;
  }

  @override
  int get hashCode {
    return Object.hash(
      time,
      interval,
      temperature2m,
      relativeHumidity2m,
      windSpeed10m,
      weatherCode,
    );
  }

  @override
  String toString() {
    return 'CurrentWeather(time: $time, interval: $interval, '
        'temperature2m: $temperature2m, relativeHumidity2m: $relativeHumidity2m, '
        'windSpeed10m: $windSpeed10m, weatherCode: $weatherCode)';
  }

  @override
  int compareTo(CurrentWeather other) {
    // Сравниваем по температуре
    return temperature2m.compareTo(other.temperature2m);
  }
}
