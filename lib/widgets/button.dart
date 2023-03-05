
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget gameBtn( void Function()? onTap, String imagePath) {
  return IconButton(
    onPressed: onTap,
      icon: Image.asset(imagePath),
    iconSize: 100,
  );
}