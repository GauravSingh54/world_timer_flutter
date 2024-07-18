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

    final Uri url = Uri.parse('https://worldtimeapi.org/api/timezone/Asia/Kolkata');
    http.Response response = await http.get(url);
    Map data = jsonDecode(response.body);
    print(data);

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