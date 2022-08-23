import 'dart:typed_data';

import 'package:empdet/model/address.dart';
import 'package:empdet/model/company.dart';

class Employee{
  int? id;
  String? name;
  String? username;
  String? email;
  Uint8List? profile_image;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  Employee.fromJson(Map<String, dynamic> data){
    id = data["id"];
    name = data["name"];
    username = data["username"];
    email = data["email"];
    profile_image = data["profile_image"];
    address = Address.fromJson(data["address"]);
    phone = data["phone"];
    website = data["website"];
    company = Company.fromJson(data["company"]);
  }
}