//   ///
//  Import  LIBRARIES
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//  Import FILES
import '../models/user_model.dart';
import '../pages/detail_screen.dart';
//  PARST
//  PROVIDERS
//  //  //   ///

Widget dataBody(AsyncValue<List<UserModel>> data) {
  return data.when(
    data: (data) {
      List<UserModel> userList = data.map((e) => e).toList();
      debugPrint(userList.toString());
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: <Widget>[
            Expanded(
                child: ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        e: userList[index],
                      ),
                    ),
                  ),
                  child: Card(
                      color: Colors.indigo,
                      elevation: 4,
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        title: Text(
                          userList[index].firstName,
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          userList[index].lastName,
                          style: const TextStyle(color: Colors.white),
                        ),
                        trailing: CircleAvatar(
                          backgroundImage: NetworkImage(
                            userList[index].avatar,
                          ),
                        ),
                      )),
                );
              },
            ))
          ],
        ),
      );
    },
    error: (error, stackTrace) => Text(error.toString()),
    loading: () => const Center(
      child: CircularProgressIndicator(),
    ),
  );
}
