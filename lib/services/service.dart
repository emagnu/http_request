//   ///
//  Import  LIBRARIES
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
//  Import FILES
import '../models/user_model.dart';

//  PARST
//  PROVIDERS
final userProvider = Provider<ApiSerivices>((ref) {
  return ApiSerivices();
});
//  //  //   ///

class ApiSerivices {
  String endpoint = "https://reqres.in/api/users?page=2";
  Future<List<UserModel>> getUsers() async {
    http.Response response = await http.get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
