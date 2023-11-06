import 'dart:convert';

class User {
  final String id; // generated by mongodb
  final String name;
  final String password;
  final String address;
  final String email;
  final String type;

  User(
      {required this.id,
      required this.email,
      required this.name,
      required this.password,
      required this.address,
      required this.type});

// set data to api object to json
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'type': type,
    };
  }

// get data from api  json to object
  String toJson() => json.encode(toMap());
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '', // server has stored data of name _id
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      address: map['address'] ?? '',
      type: map['type'] ?? '',
    );
  }
}
