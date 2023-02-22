class UserModel {
  final String name, email, password;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
  });

  // Map<String, dynamic> toJson() => {"email": email, "password": password};
}
