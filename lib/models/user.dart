// lib/models/user.dart
class User {
  final String? avatarUrl;
  final String? email;

  User({
    this.avatarUrl,
    this.email,
  });

  User copyWith({
    String? id,
    String? name,
    String? avatarUrl,
    String? email,
  }) {
    return User(
      avatarUrl: avatarUrl ?? this.avatarUrl,
      email: email ?? this.email,
    );
  }
}
