import 'package:flutter/material.dart';
import 'package:world_times/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String? t = 'loading';

  void setup() async {
    WorldTime time =
        WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London');
    await time.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': time.location,
      'flag': time.flag,
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
    return Scaffold(
        body: Center(
      child: SpinKitSpinningLines(
        color: Colors.blue,
        size: 80.0,
      ),
    ));
  }
}
