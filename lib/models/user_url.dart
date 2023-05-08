class UserUrl {
  final String username;
  final String email;
  final int id;

  const UserUrl({
    required this.username,
    required this.email,
    required this.id,
  });

  static UserUrl fromJson(json) => UserUrl(
        username: json['username'] as String,
        email: json['email'] as String,
        id: json['id'] as int,
      );
}
