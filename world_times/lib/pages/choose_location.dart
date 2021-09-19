import 'package:flutter/material.dart';
import 'package:world_times/pages/loading.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<String> t = [];

  @override
  Widget build(BuildContext context) {
    t = timezones;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Choose a location'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: timezones.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {},
              title: Text(timezones[index]),
            ),
          );
        },
      ),
    );
  }
}
