import 'package:flutter/material.dart';
import 'models/vehicle.dart';
import 'pages/show.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navigation Basics',
    home: ShowRoute(),
  ));
}