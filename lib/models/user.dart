class User {
  final String username;
  final String email;
  final String urlAvatar;

  const User({
    required this.username,
    required this.email,
    required this.urlAvatar,
  });

  static User fromJson(json) => User(
        username: json['username'] as String,
        email: json['email'] as String,
        urlAvatar: json['urlAvatar'] as String,
      );
}
