class City {
  final int id;
  final String name;
  final double latitude;
  final double longitude;

  City({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  // Фабричный метод для создания из JSON
  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'] as int,
      name: json['name'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );
  }

  // Метод для преобразования в JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  // Для удобного отображения в дебаге
  @override
  String toString() {
    return 'City{id: $id, name: $name, lat: $latitude, lng: $longitude}';
  }

  // Для сравнения объектов
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is City &&
        other.id == id &&
        other.name == name &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ latitude.hashCode ^ longitude.hashCode;
  }
}