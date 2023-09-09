import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:sharekhan/controller/beacon_controller.dart';
import 'package:sharekhan/findme.dart';
import 'package:sharekhan/routes.dart';
import 'package:sharekhan/speechtotext.dart';
import 'guideme.dart';
import 'scanner_guide.dart';

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
        actions: [IconButton(onPressed :() {
          Get.to(SpeechToText());
        }, icon: Icon(Icons.mic))],
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
              color: Colors.blueAccent,
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
            onTap: () async{
              Get.to(Routes());
              // controller.startScanning();
              // Get.to(GuideMe() , arguments: ['CB10023F-A318-3394-4199-A8730C7C1ABC','CB10023F-A318-3394-4199-A8730C7C1AEC','CB10023F-A318-3394-4199-A8730C7C1ADC']);
            },
            child: Card(
              color: Colors.deepPurpleAccent,
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
            onTap: () async{
              // Get.to(Routes());
              // controller.startScanning();
              // Get.to(GuideMe() , arguments: ['CB10023F-A318-3394-4199-A8730C7C1ABC','CB10023F-A318-3394-4199-A8730C7C1AEC','CB10023F-A318-3394-4199-A8730C7C1ADC']);
            },
            child: Card(
              color: Colors.redAccent,
              child: SizedBox(
                width: double.infinity,
                height: 170,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.map_outlined , size: 60),
                    Center(
                        child: Text('Help Me ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 40 ))),
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
