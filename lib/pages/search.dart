import 'package:flutter/material.dart';
import 'package:world_timer_flutter/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  // List<WorldTime> locations = [
  //   WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
  //   WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
  //   WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
  //   WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
  //   WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
  //   WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
  //   WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
  //   WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  // ];

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'japan.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png'),
    WorldTime(url: 'Australia/Sydney', location: 'Sydney', flag: 'australia.png'),
    WorldTime(url: 'Europe/Paris', location: 'Paris', flag: 'france.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png'),
    WorldTime(url: 'America/Los_Angeles', location: 'Los Angeles', flag: 'usa.png'),
    WorldTime(url: 'America/Toronto', location: 'Toronto', flag: 'canada.png'),
    WorldTime(url: 'Africa/Johannesburg', location: 'Johannesburg', flag: 'south_africa.png'),
    WorldTime(url: 'Asia/Dubai', location: 'Dubai', flag: 'uae.png'),
    WorldTime(url: 'Europe/Moscow', location: 'Moscow', flag: 'russia.png'),
    WorldTime(url: 'America/Sao_Paulo', location: 'Sao Paulo', flag: 'brazil.png'),
    WorldTime(url: 'Asia/Singapore', location: 'Singapore', flag: 'singapore.png'),
    WorldTime(url: 'Asia/Hong_Kong', location: 'Hong Kong', flag: 'hong_kong.png'),
    WorldTime(url: 'Europe/Rome', location: 'Rome', flag: 'italy.png'),
    WorldTime(url: 'Europe/Madrid', location: 'Madrid', flag: 'spain.png'),
    WorldTime(url: 'Europe/Zurich', location: 'Zurich', flag: 'switzerland.png'),
    WorldTime(url: 'Asia/Kuala_Lumpur', location: 'Kuala Lumpur', flag: 'malaysia.png'),
    WorldTime(url: 'Asia/Bangkok', location: 'Bangkok', flag: 'thailand.png'),
    WorldTime(url: 'Africa/Accra', location: 'Accra', flag: 'ghana.png'),
    WorldTime(url: 'Africa/Lagos', location: 'Lagos', flag: 'nigeria.png'),
    WorldTime(url: 'America/Bogota', location: 'Bogota', flag: 'colombia.png'),
    WorldTime(url: 'America/Mexico_City', location: 'Mexico City', flag: 'mexico.png'),
    WorldTime(url: 'Asia/Manila', location: 'Manila', flag: 'philippines.png'),
    WorldTime(url: 'America/Lima', location: 'Lima', flag: 'peru.png'),
    WorldTime(url: 'Asia/Riyadh', location: 'Riyadh', flag: 'saudi_arabia.png'),
    WorldTime(url: 'America/Caracas', location: 'Caracas', flag: 'venezuela.png'),
    WorldTime(url: 'Asia/Taipei', location: 'Taipei', flag: 'taiwan.png'),
    WorldTime(url: 'Australia/Perth', location: 'Perth', flag: 'australia.png'),
    WorldTime(url: 'Asia/Karachi', location: 'Karachi', flag: 'pakistan.png'),
    WorldTime(url: 'Africa/Casablanca', location: 'Casablanca', flag: 'morocco.png'),
    WorldTime(url: 'Europe/Vienna', location: 'Vienna', flag: 'austria.png'),
    WorldTime(url: 'Europe/Brussels', location: 'Brussels', flag: 'belgium.png'),
    WorldTime(url: 'Europe/Copenhagen', location: 'Copenhagen', flag: 'denmark.png'),
    WorldTime(url: 'Europe/Dublin', location: 'Dublin', flag: 'ireland.png'),
    WorldTime(url: 'Europe/Oslo', location: 'Oslo', flag: 'norway.png'),
    WorldTime(url: 'Europe/Stockholm', location: 'Stockholm', flag: 'sweden.png'),
];

  List<WorldTime> filteredLocations = [];
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    filteredLocations = locations;
    searchController.addListener(() {
      setState(() {
        searchQuery = searchController.text;
        filteredLocations = locations.where((location) {
          return location.location.toLowerCase().contains(searchQuery.toLowerCase());
        }).toList();
      });
    });
  }

  void updateTime(index) async {
    WorldTime instance = filteredLocations[index];
    await instance.getTime();
    // navigate to home screen

    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Build State Function ran');

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Choose a Location', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredLocations.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
                  child: Card(
                    child: ListTile(
                      onTap: () {
                        updateTime(index);
                      },
                      title: Text(filteredLocations[index].location),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/${filteredLocations[index].flag}'),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
