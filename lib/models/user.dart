class User {
  final String email;
  final DateTime createdAt;
  final DateTime? lastLogin; // Nullable, так как может не быть

  User({
    required this.email,
    required this.createdAt,
    this.lastLogin,
  });

  // Фабричный метод для создания из JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastLogin: json['lastLogin'] != null
          ? DateTime.parse(json['lastLogin'] as String)
          : null,
    );
  }

  // Метод для преобразования в JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'createdAt': createdAt.toIso8601String(),
      'lastLogin': lastLogin?.toIso8601String(),
    };
  }

  // Для удобного отображения
  @override
  String toString() {
    return 'User{email: $email, createdAt: $createdAt, lastLogin: $lastLogin}';
  }

  // Для сравнения объектов
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User &&
        other.email == email &&
        other.createdAt == createdAt &&
        other.lastLogin == lastLogin;
  }

  @override
  int get hashCode {
    return email.hashCode ^ createdAt.hashCode ^ lastLogin.hashCode;
  }

  // Полезные computed properties
  bool get hasLoggedIn => lastLogin != null;

  Duration? get timeSinceLastLogin {
    if (lastLogin == null) return null;
    return DateTime.now().difference(lastLogin!);
  }

  bool get isNewUser {
    // Пользователь считается новым, если создан менее часа назад
    return DateTime.now().difference(createdAt) < const Duration(hours: 1);
  }
}