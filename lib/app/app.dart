import 'package:flutter/material.dart';

import '../pages/home_page.dart';

enum AppEnv {
  dev,
  prod;
}

class FlavorsApp extends StatelessWidget {
  const FlavorsApp({super.key, required this.appEnv});

  final AppEnv appEnv;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Flavors',
      debugShowCheckedModeBanner: appEnv == AppEnv.dev ? true : false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(appEnv: appEnv),
    );
  }
}
