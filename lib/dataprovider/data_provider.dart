//   ///
//  Import  LIBRARIES
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_request/models/user_model.dart';
//  Import FILES
import '../services/service.dart';
//  PARST
//  PROVIDERS

final userDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.watch(userProvider).getUsers();
});
//  //  //   ///



