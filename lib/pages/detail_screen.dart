//   ///
//  Import  LIBRARIES
//  Import FILES
//  PARST
//  PROVIDERS
//  //  //   ///

import 'package:flutter/material.dart';
import 'package:http_request/models/user_model.dart';

class DetailScreen extends StatelessWidget {
  final UserModel e;
  const DetailScreen({super.key, required this.e});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: <Widget>[
            Center(
              child: CircleAvatar(
                maxRadius: 60,
                backgroundImage: NetworkImage(e.avatar),
              ),
            ),
            Text('${e.firstName} ${e.lastName}'),
            Text(e.email),
          ]),
        ),
      ),
    );
  }
}
