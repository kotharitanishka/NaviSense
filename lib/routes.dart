import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'findme.dart';
import 'guideme.dart';

class Routes extends StatefulWidget {
  const Routes({super.key});

  @override
  State<Routes> createState() => _RoutesState();
}

List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class _RoutesState extends State<Routes> {
  @override
  initState() {
    super.initState();
    print("initState Called");
    // controller.startScanning();
    // Get.to(FindMe());
  }
  
  String dropdownValue = list.first;
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
                            Text('Room1',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 40, )),
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
          InkWell(
            // onTap: () async{
            //   Get.to(Routes());
            //   // controller.startScanning();
            //   // Get.to(GuideMe() , arguments: ['CB10023F-A318-3394-4199-A8730C7C1ABC','CB10023F-A318-3394-4199-A8730C7C1AEC','CB10023F-A318-3394-4199-A8730C7C1ADC']);
            // },
            child: Card(
              color: Colors.deepPurpleAccent,
              child: SizedBox(
                width: double.infinity,
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Icon(Icons.map_outlined , size: 60),
                    Center(
                        child: Column(
                          children: [
                            Text('Destination ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 40 )),
                                    Text('Room2',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 40 )),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20),
                    InkWell(
            onTap: () async{
              //Get.to(Routes());
              var controller;
              controller.startScanning();
              Get.to(GuideMe() , arguments: ['CB10023F-A318-3394-4199-A8730C7C1ABC','CB10023F-A318-3394-4199-A8730C7C1AEC','CB10023F-A318-3394-4199-A8730C7C1ADC']);
            },
            child: Card(
              color: Colors.redAccent,
              child: SizedBox(
                width: double.infinity,
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Icon(Icons.map_outlined , size: 60),
                    Center(
                        child: Column(
                          children: [
                            Text('Take Me',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 40 )),
                                    
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
      // body: Padding(
      //   padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
      //   child: Column(
      //     //mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text('Source', 
      //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),

      //       SizedBox(height : 20),

      //       Text('Room1', 
      //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),

      //       SizedBox(height : 40),

      //       Text('Destination', 
      //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),

      //       SizedBox(height : 20),


      //       SizedBox(
      //         width: 200,
      //         child: DropdownButton<String>(
      //             value: dropdownValue,
      //             icon: const Icon(Icons.arrow_downward),
      //             elevation: 30,
      //             style: const TextStyle(color: Colors.deepPurple),
      //             underline: Container(
      //               height: 2,
      //               color: Colors.deepPurpleAccent,
      //             ),
      //             onChanged: (String? value) {
      //               // This is called when the user selects an item.
      //               setState(() {
      //                 dropdownValue = value!;
      //               });
      //             },
      //             items: list.map<DropdownMenuItem<String>>((String value) {
      //               return DropdownMenuItem<String>(
      //                 value: value,
      //                 child: Text(value),
      //               );
      //             }).toList(),
      //           ),
      //       ),

      //       SizedBox(height : 20),

      //     ],
      //   ),
      // ),
    );
  }
}