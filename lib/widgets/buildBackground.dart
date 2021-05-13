import 'package:flutter/material.dart';
import 'package:marvel_heroes/utils/constants.dart';

Widget buildBackground() {
  return Container(
    height: double.infinity,
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          colorRed00,
          colorRed01,
          colorRed02,
          colorRed03,
        ],
        stops: [0.1, 0.4, 0.7, 0.9],
      ),
    ),
  );
}
