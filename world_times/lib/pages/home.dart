import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    String img = data['isDay'] ? 'day.jpg' : 'night.jpg';
    Color clr = data['isDay'] ? Colors.blue : Colors.blueAccent;

    return Scaffold(
      backgroundColor: clr,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/$img'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.indigo)),
                    onPressed: () =>
                        {Navigator.pushNamed(context, '/location')},
                    icon: Icon(
                      Icons.edit_location,
                    ),
                    label: Text('Edit location')),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(fontSize: 28, letterSpacing: 2),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 60,
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
