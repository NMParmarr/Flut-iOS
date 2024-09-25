import 'package:flutter/services.dart';

class BatteryLevelPlatform {
  final _platform = MethodChannel('BatteryLevel');

  Future<String> getBatteryLevel() async {
    String batteryLevel = 'Unknown battery level.';
    try {
      final result = await _platform.invokeMethod<int>('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
    return batteryLevel;
  }
}
