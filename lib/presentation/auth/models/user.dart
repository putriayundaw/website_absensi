class User {
  final String name;
  final String email;

  User({required this.name, required this.email});

  // Menyimpan User ke dalam Map agar bisa disimpan di SharedPreferences
  Map<String, String> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }

  // Mengambil User dari Map
  static User fromMap(Map<String, String> map) {
    return User(
      name: map['name']!,
      email: map['email']!,
    );
  }
}
