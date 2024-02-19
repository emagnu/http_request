//   ///
//  Import  LIBRARIES
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//  Import FILES
import '../dataprovider/data_provider.dart';
import '../widgets/data_body.dart';
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
      body: dataBody(data),
    );
  }
}
