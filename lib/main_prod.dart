import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/app.dart';

void main() {
  runApp(
    const FlavorsApp(
      appEnv: AppEnv.prod,
    ),
  );
}