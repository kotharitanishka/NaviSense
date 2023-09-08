import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:get/get.dart';
import 'controller/beacon_controller.dart';

class TabScanner extends StatefulWidget {
  const TabScanner({super.key});

  @override
  State<TabScanner> createState() => _TabScannerState();
}

class _TabScannerState extends State<TabScanner> {
  StreamSubscription<RangingResult>? _streamRanging;
  final _regionBeacons = <Region, List<Beacon>>{};
  final _beacons = <Beacon>[];
  final controller = Get.find<RequirementStateController>();

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
    Map<String, dynamic> m = {
      "CB10023F-A318-3394-4199-A8730C7C1AEC": {
        "name": "Cafe",
        "desc": "You are at"
      },
        "CB10023F-A318-3394-4199-A8730C7C1ABC": {
        "name": "Sanya",
        "desc": "You are at"
      },
        "CB10023F-A318-3394-4199-A8730C7C1ADC": {
        "name": "Aayushi",
        "desc": "You are at"
      }
    };

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
        proximityUUID: 'CB10023F-A318-3394-4199-A8730C7C1ABC'
      ),
      Region(
        identifier: 'BeaconType2',
        proximityUUID: 'CB10023F-A318-3394-4199-A8730C7C1ADC',
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
        setState(() {
          _regionBeacons[result.region] = result.beacons;
          _beacons.clear();
          _regionBeacons.values.forEach((list) {
            _beacons.addAll(list);
          });
          _beacons.sort((a, b) => a.accuracy.compareTo(b.accuracy));
          if (_beacons.isNotEmpty) {
            Beacon nearest = _beacons[0];
            controller.tellNearestBeacon(m[nearest.proximityUUID]['name'],
                m[nearest.proximityUUID]['desc'] + "${nearest.accuracy} meters from " + m[nearest.proximityUUID]['name'], nearest.proximityUUID);
          }
        });
      }
    });
  }

  pauseScanBeacon() async {
    _streamRanging?.pause();
    if (_beacons.isNotEmpty) {
      setState(() {
        _beacons.clear();
      });
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
