class WeatherModel {
  num? latitude;
  num? longitude;
  num? generationtimeMs;
  num? utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  num? elevation;
  CurrentWeatherUnits? currentWeatherUnits;
  CurrentWeather? currentWeather;

  WeatherModel(
      {this.latitude,
      this.longitude,
      this.generationtimeMs,
      this.utcOffsetSeconds,
      this.timezone,
      this.timezoneAbbreviation,
      this.elevation,
      this.currentWeatherUnits,
      this.currentWeather});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'] as num?;
    longitude = json['longitude'] as num?;
    generationtimeMs = json['generationtime_ms'] as num?;
    utcOffsetSeconds = json['utc_offset_seconds'] as num?;
    timezone = json['timezone'];
    timezoneAbbreviation = json['timezone_abbreviation'];
    elevation = json['elevation'] as num?;
    currentWeatherUnits = json['current_weather_units'] != null
        ? new CurrentWeatherUnits.fromJson(json['current_weather_units'])
        : null;
    currentWeather = json['current_weather'] != null
        ? new CurrentWeather.fromJson(json['current_weather'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['generationtime_ms'] = this.generationtimeMs;
    data['utc_offset_seconds'] = this.utcOffsetSeconds;
    data['timezone'] = this.timezone;
    data['timezone_abbreviation'] = this.timezoneAbbreviation;
    data['elevation'] = this.elevation;
    if (this.currentWeatherUnits != null) {
      data['current_weather_units'] = this.currentWeatherUnits!.toJson();
    }
    if (this.currentWeather != null) {
      data['current_weather'] = this.currentWeather!.toJson();
    }
    return data;
  }
}

class CurrentWeatherUnits {
  String? time;
  String? interval;
  String? temperature;
  String? windspeed;
  String? winddirection;
  String? isDay;
  String? weathercode;

  CurrentWeatherUnits(
      {this.time,
      this.interval,
      this.temperature,
      this.windspeed,
      this.winddirection,
      this.isDay,
      this.weathercode});

  CurrentWeatherUnits.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    interval = json['interval'];
    temperature = json['temperature'];
    windspeed = json['windspeed'];
    winddirection = json['winddirection'];
    isDay = json['is_day'];
    weathercode = json['weathercode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['interval'] = this.interval;
    data['temperature'] = this.temperature;
    data['windspeed'] = this.windspeed;
    data['winddirection'] = this.winddirection;
    data['is_day'] = this.isDay;
    data['weathercode'] = this.weathercode;
    return data;
  }
}

class CurrentWeather {
  String? time;
  num? interval;
  num? temperature;
  num? windspeed;
  num? winddirection;
  num? isDay;
  num? weathercode;

  CurrentWeather(
      {this.time,
      this.interval,
      this.temperature,
      this.windspeed,
      this.winddirection,
      this.isDay,
      this.weathercode});

  CurrentWeather.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    interval = json['interval'] as num?;
    temperature = json['temperature'] as num?;
    windspeed = json['windspeed'] as num?;
    winddirection = json['winddirection'] as num?;
    isDay = json['is_day'] as num?;
    weathercode = json['weathercode'] as num?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['interval'] = this.interval;
    data['temperature'] = this.temperature;
    data['windspeed'] = this.windspeed;
    data['winddirection'] = this.winddirection;
    data['is_day'] = this.isDay;
    data['weathercode'] = this.weathercode;
    return data;
  }
}
