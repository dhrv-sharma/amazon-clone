import 'dart:convert';

class User {
  // name setted according to the server
  final String id; // generated by mongodb
  final String name;
  final String password;
  final String address;
  final String email;
  final String type;
  String? token;

  User(
      {required this.id,
      required this.email,
      required this.name,
      required this.password,
      required this.address,
      required this.type,
      this.token});

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

  String toJson() => json.encode(toMap());
// get data from api  json to object
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

// decoding string to json
  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
