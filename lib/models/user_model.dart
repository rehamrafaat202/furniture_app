import 'package:flutter/cupertino.dart';

class UserModel {
  String? name;
  String? email;
  dynamic? phone;
  dynamic? dateOfBirth;
  String? address;
  UserModel(
      {required this.name,
      required this.email,
      required this.address,
      required this.dateOfBirth,
      required this.phone});
  UserModel.fromJson(Map<dynamic, dynamic> json) {
    name = json["name"];
    email = json["email"];
    phone = json["phone"];
    dateOfBirth = json["dateOfBirth"];
    address = json["address"];
  }
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "dateOfBirth": dateOfBirth,
      "address": address
    };
  }
}
