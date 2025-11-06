class User {
  final String id;
  final String username;
  final String gmail;
  final String birthday;
  final String rol;
  final String? password;
  final String? token;
  final String? refreshToken;

  User({
    required this.id,
    required this.username,
    required this.gmail,
    required this.birthday,
    required this.rol,
    this.password,
    this.token,
    this.refreshToken,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] ?? '',
      username: json['username'] ?? '',
      gmail: json['gmail'] ?? '',
      birthday: json['birthday'] ?? '',
      rol: json['rol'] ?? 'user',
      token: json['token'],
      refreshToken: json['refreshToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'gmail': gmail,
      'password': password,
      'birthday': birthday,
      'rol': rol,
    };
  }
}