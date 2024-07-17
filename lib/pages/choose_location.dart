// ignore_for_file: avoid_print

import 'package:flutter/material.dart';


class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  

  @override
  Widget build(BuildContext context) {
    print('Build State Function ran');

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Choose a Location', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        elevation: 0,
      ),
      body: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
        ),
        onPressed: () {},
        child: const Text('Counter is', style: const TextStyle(color: Colors.white),),
      ),
    );
  }
}
