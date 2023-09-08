import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:get/get.dart';
import 'package:vibration/vibration.dart';
import 'controller/beacon_controller.dart';

class GuideScanner extends StatefulWidget {
  const GuideScanner({super.key});

  @override
  State<GuideScanner> createState() => _GuideScannerState();
}

class _GuideScannerState extends State<GuideScanner> {
  StreamSubscription<RangingResult>? _streamRanging;
  final _regionBeacons = <Region, List<Beacon>>{};
  final _beacons = <Beacon>[];
  final controller = Get.find<RequirementStateController>();
  List<String> path = Get.arguments;

  @override
  void initState() {
    super.initState();

    controller.startStream.listen((flag) {
      if (flag == true) {
        initScanBeacon();
        controller.startScanning();
      }
    });

    controller.pauseStream.listen((flag) {
      if (flag == true) {
        pauseScanBeacon();
      }
    });
  }

  initScanBeacon() async {
    await flutterBeacon.initializeScanning;
    if (!controller.authorizationStatusOk ||
        !controller.locationServiceEnabled ||
        !controller.bluetoothEnabled) {
      print(
          'RETURNED, authorizationStatusOk=${controller.authorizationStatusOk}, '
          'locationServiceEnabled=${controller.locationServiceEnabled}, '
          'bluetoothEnabled=${controller.bluetoothEnabled}');
      return;
    }
    final regions = <Region>[
      Region(
        identifier: '',
        proximityUUID: 'CB10023F-A318-3394-4199-A8730C7C1AEC',
      ),
      Region(
        identifier: 'com.example.myDeviceRegion',
        proximityUUID: '39ED98FF-2900-441A-802F-9C398FC199D2',
      ),
      Region(
        identifier: 'BeaconType2',
        proximityUUID: '6a84c716-0f2a-1ce9-f210-6a63bd873dd9',
      ),
    ];

    if (_streamRanging != null) {
      if (_streamRanging!.isPaused) {
        _streamRanging?.resume();
        return;
      }
    }

    _streamRanging =
        flutterBeacon.ranging(regions).listen((RangingResult result) {
      print(result);
      if (mounted) {
        print("hello");
        setState(() {
          _regionBeacons[result.region] = result.beacons;
          _beacons.clear();
          _regionBeacons.values.forEach((list) {
            _beacons.addAll(list);
          });
          if (path.isNotEmpty) {
            Beacon? b = _beacons.firstWhereOrNull(
                (element) => path[0] == element.proximityUUID);
            if (b != null) {
              if (b.accuracy <= 0.5) {
                controller.tellcheckpoints('reached checkpoint');
                path.remove(b.proximityUUID);
                if (path.isEmpty) {
                  Get.back();
                }
              }
              print("hello");
            }
          } else {
            Get.back();
          }
        });
      }
    });
  }

  pauseScanBeacon() async {
    _streamRanging?.pause();
    if (_beacons.isNotEmpty) {
      if (mounted) {
        setState(() {
          _beacons.clear();
        });
      }
    }
  }

  int _compareParameters(Beacon a, Beacon b) {
    int compare = a.accuracy.compareTo(b.accuracy);

    if (compare == 0) {
      compare = a.major.compareTo(b.major);
    }

    if (compare == 0) {
      compare = a.minor.compareTo(b.minor);
    }

    return compare;
  }

  @override
  void dispose() {
    _streamRanging?.cancel();
    pauseScanBeacon();
    flutterBeacon.close;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _beacons.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: ListTile.divideTiles(
                context: context,
                tiles: _beacons.map(
                  (beacon) {
                    return ListTile(
                      title: Text(
                        beacon.proximityUUID,
                        style: TextStyle(fontSize: 15.0),
                      ),
                      subtitle: new Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              'Accuracy: ${beacon.accuracy}m\nRSSI: ${beacon.rssi}',
                              style: TextStyle(fontSize: 13.0),
                            ),
                            flex: 2,
                            fit: FlexFit.tight,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ).toList(),
            ),
    );
  }
}
