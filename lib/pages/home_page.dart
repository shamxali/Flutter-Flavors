import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/app.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.appEnv}) : super(key: key);
  final AppEnv appEnv;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CollectionReference flavorsRef = FirebaseFirestore.instance.collection('flavors');

  Future<void> addFlavors() {
    return flavorsRef
        .add({
          'env_name': describeEnum(widget.appEnv).toUpperCase(),
          'platform': Platform.isIOS ? 'IOS' : 'Android',
        })
        .then((value) => debugPrint("Flavor added successfully"))
        .catchError((error) => debugPrint("Failed to add flavor: $error"));
  }

  @override
  void initState() {
    super.initState();
    addFlavors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Flavors',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 18),
        ),
      ),
      body: Center(
        child: Text(
          'Flavor : ${describeEnum(widget.appEnv).toUpperCase()}',
        ),
      ),
    );
  }
}
