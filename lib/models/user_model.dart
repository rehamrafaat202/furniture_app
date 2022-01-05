import 'package:flutter/cupertino.dart';

class UserModel {
  String? uid;
  String? email;
  dynamic? phone;
  dynamic? dateOfBirth;
  String? address;
  UserModel(
      {required this.uid,
      required this.email,
      required this.address,
      required this.dateOfBirth,
      required this.phone});
  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json["uid"];
    email = json["email"];
    phone = json["phone"];
    dateOfBirth = json["dateOfBirth"];
    address = json["address"];
  }
  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "phone": phone,
      "dateOfBirth": dateOfBirth,
      "address": address
    };
  }
}
