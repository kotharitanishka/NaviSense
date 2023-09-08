import 'package:flutter/material.dart';

class Outdoor extends StatefulWidget {
  const Outdoor({super.key});

  @override
  State<Outdoor> createState() => _OutdoorState();
}

class _OutdoorState extends State<Outdoor> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Outdoor Navigation')),
        body: Center(
          child: Column(
            children: <Widget>[
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    ListTile(
                      leading: Icon(Icons.train, size: 90),
                      title: Text('Railway Station',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      // subtitle: Text('For train enquiries and ticket booking'),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                color: Colors.yellow,
                margin: EdgeInsets.all(20.0),
              ),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    ListTile(
                      leading: Icon(Icons.local_police, size: 85),
                      title: Text('Police Station',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      // subtitle: Text('For reporting crimes and emergencies'),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                color: Colors.blue,
                margin: EdgeInsets.all(20.0),
              ),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.local_hospital,
                        size: 55,
                      ),
                      title: Text('Hospital',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      // subtitle: Text('For medical emergencies and treatment'),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                color: Colors.red,
                margin: EdgeInsets.all(20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
