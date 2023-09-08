import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:sharekhan/controller/beacon_controller.dart';
import 'package:sharekhan/findme.dart';

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
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 20, left: 10),
          child: Text('Indoor',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(children: [
          InkWell(
            onTap: () async{
              controller.startScanning();
              Get.to(FindMe());
            },
            child: Card(
              child: SizedBox(
                width: double.infinity,
                height: 250,
                child: Center(
                    child: Text('Find Me',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 40))),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () async{
              FlutterTts flutterTts = FlutterTts();
              await flutterTts.speak("guide me is working");
              print("guide me is working");
            },
            child: Card(
              child: SizedBox(
                width: double.infinity,
                height: 250,
                child: Center(
                    child: Text('Guide Me ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 40))),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
