class UserModel {
  String? phone_number;
  String email = '';
  String password = '';
  String? name;
  String? uid;
  String? join_date;
  String? gender;

  UserModel({
    required this.phone_number,
    required this.name,
    required this.uid,
    required this.join_date,
    required this.gender,
    required this.email,
    required this.password,
  });

  factory UserModel.fromJson(Map<dynamic, dynamic>? json) {
    if (json == null) {
      return UserModel(
        phone_number: null,
        name: null,
        uid: null,
        join_date: null,
        gender: null,
        email: '',
        password: '',
      );
    }

    return UserModel(
      phone_number: json['phone_number'],
      name: json['name'],
      uid: json['uid'],
      join_date: json['join_date'],
      gender: json['gender'],
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'phone_number': phone_number,
      'name': name,
      'uid': uid,
      'join_date': join_date,
      'gender': gender,
      'email': email,
      'password': password,
    };

    // Remove null or empty values from the map
    data.removeWhere((key, value) => value == null || value == '');

    return data;
  }
}
