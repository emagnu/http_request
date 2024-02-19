//   ///
//  Import  LIBRARIES
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//  Import FILES
import '../dataprovider/data_provider.dart';
import '../models/user_model.dart';
import 'detail_screen.dart';
//  PARST
//  PROVIDERS
//  //  //   ///

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: data.when(
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
      ),
    );
  }
}
