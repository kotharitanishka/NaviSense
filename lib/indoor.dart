import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:sharekhan/controller/beacon_controller.dart';
import 'package:sharekhan/findme.dart';
import 'package:sharekhan/routes.dart';
import 'package:sharekhan/speechtotext.dart';
import 'guideme.dart';
import 'scanner_guide.dart';
import 'package:http/http.dart' as http;

// Future<String> fetchData() async {
//   final url = Uri.parse(
//       'http://16.171.114.220:8000/getNearestHelper/currRoom=CB10023F-A318-3394-4199-A8730C7C1AAA'); // Replace with your API endpoint

//   try {
//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       // Successful response, parse the data here
//       var body = response.body;
//       return(body.room);
//     } else {
//       // Handle errors here, e.g., network issues or non-200 status codes
//       print('Request failed with status: ${response.statusCode}');
//     }
//   } catch (e) {
//     // Handle any exceptions that may occur during the request
//     print('Error: $e');
//   }
// }

class Indoor extends StatefulWidget {
  const Indoor({super.key});

  @override
  State<Indoor> createState() => _IndoorState();
}

class _IndoorState extends State<Indoor> {
  final controller = Get.put(RequirementStateController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(232, 36, 12, 67),
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 20, left: 10),
          child: Text('Indoor',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(SpeechToText());
              },
              icon: Icon(Icons.mic))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(children: [
          InkWell(
            onTap: () async {
              controller.startScanning();
              Get.to(FindMe());
            },
            child: Card(
              color: Color.fromARGB(232, 206, 178, 243),
              child: SizedBox(
                width: double.infinity,
                height: 170,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.pin_drop_outlined, size: 60),
                    Center(
                        child: Text('Locate Me',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ))),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () async {
              Get.to(Routes());
              // controller.startScanning();
              // Get.to(GuideMe() , arguments: ['CB10023F-A318-3394-4199-A8730C7C1ABC','CB10023F-A318-3394-4199-A8730C7C1AEC','CB10023F-A318-3394-4199-A8730C7C1ADC']);
            },
            child: Card(
              color: Color.fromARGB(232, 206, 178, 243),
              child: SizedBox(
                width: double.infinity,
                height: 170,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.map_outlined, size: 60),
                    Center(
                        child: Text('Guide Me ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 40))),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () async {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Help is Reaching'),
                      content: const Text(
                          "Stay calm assistance is just around the corner!"),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  });

              // Get.to(Routes());
              // controller.startScanning();
              // Get.to(GuideMe() , arguments: ['CB10023F-A318-3394-4199-A8730C7C1ABC','CB10023F-A318-3394-4199-A8730C7C1AEC','CB10023F-A318-3394-4199-A8730C7C1ADC']);
            },
            child: Card(
              color: Color.fromARGB(232, 206, 178, 243),
              child: SizedBox(
                width: double.infinity,
                height: 170,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.map_outlined, size: 60),
                    Center(
                        child: Text('Help Me ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 40))),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
