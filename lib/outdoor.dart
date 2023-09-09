import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';

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
        appBar: AppBar(
          title: const Text(
            'Outdoor',
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () => MapsLauncher.launchCoordinates(
                    19.158528171935643,
                    72.99935435913864,
                    'Railway Station with wheel chairs'),
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      ListTile(
                        leading: Icon(Icons.wheelchair_pickup, size: 72),
                        title: Text('Railway Station',
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        subtitle: Text('With Wheel Chair'),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  color: Colors.white,
                  margin: EdgeInsets.all(20.0),
                ),
              ),
              ElevatedButton(
                onPressed: () => MapsLauncher.launchCoordinates(
                    19.148535588778635,
                    72.99312404827755,
                    'Police Station is here'),
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      ListTile(
                        leading: Icon(Icons.local_police, size: 72),
                        title: Text('Police Station',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        subtitle: Text('For reporting crimes and emergencies'),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  color: Colors.white,
                  margin: EdgeInsets.all(20.0),
                ),
              ),
              ElevatedButton(
                onPressed: () => MapsLauncher.launchCoordinates(
                    19.15694558761436, 72.99767922839634, 'Idravati Hospital'),
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      ListTile(
                        leading: Icon(Icons.local_hospital, size: 50),
                        title: Text('Hospital',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        subtitle: Text('For medical emergencies and treatment'),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  color: Colors.white,
                  margin: EdgeInsets.all(20.0),
                ),
              ),
              ElevatedButton(
                onPressed: () => MapsLauncher.launchCoordinates(
                    19.16589609074014, 73.00022139611664, 'Restaurant is here'),
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      ListTile(
                        leading: Icon(Icons.sign_language_sharp, size: 40),
                        title: Text('Restaurants',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        subtitle: Text('Restaurant with sign language'),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  color: Colors.white,
                  margin: EdgeInsets.all(20.0),
                ),
              ),
              ElevatedButton(
                onPressed: () => MapsLauncher.launchCoordinates(
                    19.174822086258068,
                    72.9921733090028,
                    'Current Location is Sharekhan '),
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      ListTile(
                        leading: Icon(Icons.location_city, size: 50),
                        title: Text('Locate Me',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        subtitle: Text('Current Location'),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  color: Colors.white,
                  margin: EdgeInsets.all(20.0),
                ),
              ),

              // Card(
              //   child: Column(
              //     mainAxisSize: MainAxisSize.min,
              //     children: const <Widget>[
              //       ListTile(
              //         leading: Icon(Icons.local_hospital),
              //         title: Text('Hospital',
              //             style: TextStyle(
              //                 fontSize: 30,
              //                 fontWeight: FontWeight.bold,
              //                 color: Colors.black)),
              //         subtitle: Text('For medical emergencies and treatment'),
              //       ),
              //     ],
              //   ),
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(12.0),
              //   ),
              //   color: Colors.red,
              //   margin: EdgeInsets.all(16.0),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
