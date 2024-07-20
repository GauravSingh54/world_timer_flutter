

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    print(data);

    // set background
    String bgImage = data['isDayTime'] ? 'assets/day.jpg' : 'assets/night.jpg';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.black;
    Color textColor = data['isDayTime'] ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(bgImage),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time' : result['time'],
                        'location' : result['location'],
                        'isDayTime' : result['isDayTime'],
                        'flag' : result['flag'],
                      };
                    });
                  },
                  icon: Icon(Icons.edit_location, color: textColor),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(color: textColor),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        color: textColor,
                        fontSize: 28,
                        letterSpacing: 2,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  data['time'],
                  style: TextStyle(
                    color: textColor,
                    fontSize: 66,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
