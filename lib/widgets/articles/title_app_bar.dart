import 'package:flutter/material.dart';

AppBar titleAppBar({required String title}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    foregroundColor: Colors.black,
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
    ),
    centerTitle: true,
  );
}
