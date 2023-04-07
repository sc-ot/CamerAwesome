import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:flutter/material.dart';

class DrivableCamera extends StatelessWidget {
  final SaveConfig saveConfig;
  final List<Sensor> sensors;
  final ExifPreferences? exifPreferences;

  const DrivableCamera({
    super.key,
    required this.saveConfig,
    required this.sensors,
    this.exifPreferences,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CameraAwesomeBuilder.awesome(
          saveConfig: saveConfig,
          onMediaTap: (media) {},
          sensorConfig: sensors.length == 1
              ? SensorConfig.single(
                  aspectRatio: CameraAspectRatios.ratio_1_1,
                  flashMode: FlashMode.always,
                )
              : SensorConfig.multiple(
                  sensors: sensors,
                  flashMode: FlashMode.always,
                ),
          exifPreferences: exifPreferences,
        ),
      ),
    );
  }
}
