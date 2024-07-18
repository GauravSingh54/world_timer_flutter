// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async {
    // final Uri url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
    // http.Response response = await http.get(url);
    // Map data = jsonDecode(response.body);
    // print(data);
    // print(data['title']);

    // final Uri url = Uri.parse('https://worldtimeapi.org/api/timezone/Asia/Kolkata');
    // final Uri url = Uri.parse('https://worldtimeapi.org/api/timezone/Europe/Moscow');
    // final Uri url = Uri.parse('https://worldtimeapi.org/api/timezone/Etc/GMT-7');
    final Uri url = Uri.parse('https://worldtimeapi.org/api/timezone/Europe/London');
    http.Response response = await http.get(url);
    Map data = jsonDecode(response.body);
    // print(data);

    // get properties from data

    String datetime = data['datetime'];
    String offset = data['utc_offset'];
    // print('Datetime : $datetime');
    // print('Offset : $offset');


     if (offset.length >= 3) {
      // Default to hours only
      int offsetHours = int.parse(offset.substring(1, 3));
      int offsetMinutes = 0;

      // If offset has minutes, parse them
      if (offset.length >= 6) {
        offsetMinutes = int.parse(offset.substring(4, 6));
      }

      // Create a DateTime object and add/subtract the offset
      DateTime now = DateTime.parse(datetime);
      Duration offsetDuration = Duration(hours: offsetHours, minutes: offsetMinutes);
      if (offset.startsWith('-')) {
        now = now.subtract(offsetDuration);
      } else {
        now = now.add(offsetDuration);
      }

      print('Current Time: $now');
    } else {
      print('Invalid offset format: $offset');
    }
  }



  @override
  void initState() {
    super.initState();
      getTime();  
    }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Text('Loading Screen')),
    );
  }
}