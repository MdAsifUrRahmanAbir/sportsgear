import 'package:flutter/material.dart';

Widget customButton (String buttonText,onPressed){
  return SizedBox(
    width: 38,
    height: 20,
    child: ElevatedButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(
            color: Colors.white, fontSize: 18),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        elevation: 3,
      ),
    ),
  );
}