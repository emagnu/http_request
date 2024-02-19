//   ///
//  Import  LIBRARIES
import 'dart:convert';
//  Import FILES
//  PARST
//  PROVIDERS
//  //  //   ///

// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"] ?? 'First Name',
        lastName: json["last_name"] ?? 'Last Name',
        avatar: json["avatar"] ??
            'https://hips.hearstapps.com/toc.h-cdn.co/assets/16/14/1459816624-1954-mercedes-300sl-gullwing-a.jpg?crop=0.9197461739455021xw:1xh;center,top&resize=2048:*',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}
