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
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
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
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'location': result['location'],
                          'time': result['time'],
                          'isDay': result['isDay'],
                        };
                      });
                    },
                    icon: const Icon(
                      Icons.edit_location,
                    ),
                    label: const Text('Edit location')),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(fontSize: 28, letterSpacing: 2,
                        color: data['isDay'] ? Colors.black : Colors.white
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 60,
                    color: data['isDay'] ? Colors.black : Colors.white
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
