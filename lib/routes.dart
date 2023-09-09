import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/beacon_controller.dart';
import 'findme.dart';
import 'guideme.dart';

class Routes extends StatefulWidget {
  const Routes({super.key});

  @override
  State<Routes> createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  

  final RequirementStateController controller = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(controller.beaconData[controller.nearestUUID??"CB10023F-A318-3394-4199-A8730C7C1AEC"]);
  }
  
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 20, left: 10),
          child: Text('',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
        ),
      ),
            body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: SingleChildScrollView(
          child: Column(children: [
            InkWell(
              // onTap: () async{
              //   controller.startScanning();
              //   Get.to(FindMe());
              // },
              child: Card(
                color: Colors.blueAccent,
                child: SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Icon(Icons.pin_drop_outlined, size: 60),
                      Center(
                          child: Column(
                            children: [
                              Text('Source',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 40, )),
                              Text(controller.nearestName??'Cafe',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 40, color: Colors.white)),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
        
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Where to ?' , 
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
            ),
        
            SizedBox(
              height: 20),
        
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: (controller.beaconData[controller.nearestUUID??"CB10023F-A318-3394-4199-A8730C7C1AEC"]!['paths']! as List).length,
              itemBuilder: (context, index) {
                List<String> paths = controller.beaconData[controller.nearestUUID??"CB10023F-A318-3394-4199-A8730C7C1AEC"]!['paths']! as List <String>;
        
              return InkWell(
              onTap: () async{
              controller.startScanning();
              Get.off(GuideMe() , arguments: controller.beaconData[controller.nearestUUID??"CB10023F-A318-3394-4199-A8730C7C1AEC"]![paths[index]] as List<String>);
            },
              child: Card(
                color: Colors.deepPurpleAccent,
                child: SizedBox(
                  width: double.infinity,
                  //height: 120,
                  child: Center(
                      child: Text(paths[index],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 40, ))),
                ),
              ),
            );
        
            },),
        
              SizedBox(
              height: 20),
        
              
          ]),
        ),
      ),
      
    );
  }
}