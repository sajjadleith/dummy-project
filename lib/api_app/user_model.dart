import 'package:music_app/api_app/address_model.dart';
import 'package:music_app/api_app/company_model.dart';
import 'package:music_app/api_app/geo_model.dart';

class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final AddressModel address;
  final CompanyModel company;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.company,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'], // int -> int
      name: json['name'], // string -> string
      username: json['username'],
      email: json['email'],
      address: AddressModel.fromJson(json['address']), // model -> json {}
      company: CompanyModel.fromJson(json['company']),
    );
  }
}
