import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:vibration/vibration.dart';

class RequirementStateController extends GetxController {
  var bluetoothState = BluetoothState.stateOff.obs;
  var authorizationStatus = AuthorizationStatus.notDetermined.obs;
  var locationService = false.obs;
  String? nearestDesc;
  String? nearestName;
  String? nearestUUID;
  var _startBroadcasting = false.obs;
  var _startScanning = false.obs;
  var _pauseScanning = false.obs;

  bool get bluetoothEnabled => bluetoothState.value == BluetoothState.stateOn;
  bool get authorizationStatusOk =>
      authorizationStatus.value == AuthorizationStatus.allowed ||
      authorizationStatus.value == AuthorizationStatus.always;
  bool get locationServiceEnabled => locationService.value;

  updateBluetoothState(BluetoothState state) {
    bluetoothState.value = state;
  }

  updateAuthorizationStatus(AuthorizationStatus status) {
    authorizationStatus.value = status;
  }

  updateLocationService(bool flag) {
    locationService.value = flag;
  }

  startBroadcasting() {
    _startBroadcasting.value = true;
  }

  stopBroadcasting() {
    _startBroadcasting.value = false;
  }

  startScanning() {
    _startScanning.value = true;
    _pauseScanning.value = false;
  }

  pauseScanning() {
    _startScanning.value = false;
    _pauseScanning.value = true;
  }

  Stream<bool> get startBroadcastStream {
    return _startBroadcasting.stream;
  }

  void tellNearestBeacon(String n, String d, String id) async {
    nearestDesc = d;
    nearestName = n;
    nearestUUID = id;
    FlutterTts flutterTts = FlutterTts();
    print("sas");
    await flutterTts.speak(nearestName ?? "");
    await flutterTts.speak(nearestDesc ?? "");
    pauseScanning();
    Get.back();
  }

  void tellcheckpoints(String d) async {
    FlutterTts flutterTts = FlutterTts();
    bool? checkvibe = await Vibration.hasVibrator();
    if (checkvibe == null) {
      print('thats why its failing');
    }
    if (checkvibe != null) {
      print('its working');
      Vibration.vibrate();
    }
    await flutterTts.speak(d);
  }

  Stream<bool> get startStream {
    return _startScanning.stream;
  }

  Stream<bool> get pauseStream {
    return _pauseScanning.stream;
  }
}
