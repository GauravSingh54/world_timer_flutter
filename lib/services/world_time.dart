// ignore_for_file: avoid_print
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';



class WorldTime {

  late String location;  //location name for the UI
  late String time; //Time in that location
  late String flag; // URL to asset flag icon
  late String url;  // location url for api end point
  late bool isDayTime; // true or false if daytime or not


  WorldTime({ required this.location, required this.flag, required this.url});

  Future <void> getTime() async {
    
    try{

      

    // final Uri url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
    // http.Response response = await http.get(url);
    // Map data = jsonDecode(response.body);
    // print(data);
    // print(data['title']);

    final Uri apiurl = Uri.parse('https://worldtimeapi.org/api/timezone/$url');
    http.Response response = await http.get(apiurl);
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

      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);

      print('Current Time: $now');
    } else {
      print('Invalid offset format: $offset');
    }
      
    }

    catch (e) {
      print('Caught Error: $e');
      time = 'Could not get time data';
    }


  }


}


