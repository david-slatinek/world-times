import 'package:flutter/material.dart';
import 'package:world_times/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

List<String> timezones = [];

class _LoadingState extends State<Loading> {
  String? t = 'loading';

  void setup() async {
    WorldTime time = WorldTime(url: 'ip');
    await time.getTime();

    Response response =
        await get(Uri.parse('http://worldtimeapi.org/api/timezone'));
    timezones = (jsonDecode(response.body) as List<dynamic>).cast<String>();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': time.location,
      'time': time.time,
      'isDay': time.isDay,
    });
  }

  @override
  void initState() {
    super.initState();
    setup();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: SpinKitSpinningLines(
        color: Colors.blue,
        size: 80.0,
      ),
    ));
  }
}
