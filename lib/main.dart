import 'package:flutter/material.dart';
import 'package:world_timer_flutter/pages/home.dart';
import 'package:world_timer_flutter/pages/choose_location.dart';
import 'package:world_timer_flutter/pages/loading.dart';

void main() => runApp(MaterialApp(
  // home: Home(),
  initialRoute: '/',
  routes: {
    '/': (context) => const Loading(),
    '/home': (context) => const Home(),
    '/location': (context) => const ChooseLocation(),
  },
));




