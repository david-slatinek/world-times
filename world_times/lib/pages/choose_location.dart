import 'package:flutter/material.dart';
import 'package:world_times/pages/loading.dart';
import 'package:world_times/services/world_time.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  void updateTime(int index) async {
    WorldTime w = WorldTime(url: timezones[index]);
    await w.getTime();
    EasyLoading.dismiss();
    Navigator.pop(context, {
      'location': w.location,
      'time': w.time,
      'isDay': w.isDay,
      'date': w.date,
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.blueAccent,
          title: const Text('Choose a location'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: timezones.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  EasyLoading.show(status: 'loading...');
                  updateTime(index);
                },
                title: Text(timezones[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
