import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location = 'unknown';
  String time = 'unknown';
  String url = 'ip';
  bool isDay = false;

  WorldTime({required this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/$url'));
      Map data = jsonDecode(response.body);

      location = data['timezone'];
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      time = DateFormat.jm().format(now);
      isDay = now.hour > 6 && now.hour < 20 ? true : false;
    } catch (e) {
      print(e);
      time = 'error while getting data';
    }
  }
}
