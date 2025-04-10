// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:school_management_system/student/controllers/lessonsController.dart';

class TlessonBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => lessonsController());
  }
}
