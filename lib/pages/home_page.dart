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
  CollectionReference users = FirebaseFirestore.instance.collection('flavors');

  Future<void> addFlavors() {
    return users
        .add({'env_name': describeEnum(widget.appEnv).toUpperCase()})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  void initState() {
    super.initState();
    addFlavors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(describeEnum(widget.appEnv).toUpperCase())),
      body: Center(
        child: Text('Flutter Flavors'),
      ),
    );
  }
}
