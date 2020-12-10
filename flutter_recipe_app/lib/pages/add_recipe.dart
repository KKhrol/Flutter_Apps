import 'dart:io';
import 'package:flutter/material.dart';

class MyAddPage extends StatefulWidget {
  final String id;
  const MyAddPage({this.id});
  @override
  _MyAddPageState createState() => _MyAddPageState();
}

class _MyAddPageState extends State<MyAddPage> {
  TextEditingController recipeInputController;
  TextEditingController nameInputController;

  String name;
  String recipe;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
