import 'package:flutter/material.dart';

@override
AppBar buildAppBar(BuildContext context, {required String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    leading: GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: const Icon(Icons.arrow_back_ios_new),
    ),
    title: Text(title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
  );
}
