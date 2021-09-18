import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Object? data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton.icon(
                onPressed: () => {Navigator.pushNamed(context, '/location')},
                icon: Icon(Icons.edit_location),
                label: Text('Edit location'))
          ],
        ),
      ),
    );
  }
}
