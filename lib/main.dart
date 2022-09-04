import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shale_app/binding/home_binding.dart';
import 'package:shale_app/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomeView(),
          binding: HomeBinding(),
        ),
      ],
    );
  }
}
