import 'package:flutter/material.dart';
import 'package:world_times/pages/home.dart';
import 'package:world_times/pages/loading.dart';
import 'package:world_times/pages/choose_location.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}
