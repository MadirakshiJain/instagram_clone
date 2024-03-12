import 'package:flutter_application_2/services.dart/permission.dart';
//import 'package:flutter_application_2/services/permission.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class CheckPermission {
  Future<PermissionStatus> checkLocationPermission() async {
    final status = await Permission.locationWhenInUse.status;
    if (status.isGranted) {
    } else {
      requestLocationPermission();
    }
    return status;
  }

  Future<void> requestLocationPermission() async {
    final status = await Permission.locationWhenInUse.request();
    if (status.isGranted) {
      Get.toNamed('/');
    } else {
      Get.off(LocationPermissionHandler());
    }
  }
}
