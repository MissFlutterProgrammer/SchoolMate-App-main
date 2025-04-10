// ignore_for_file: file_names

import 'package:get/state_manager.dart';
import 'package:school_management_system/student/resources/AnnouncementsServeces/AnnouncementsServeces.dart';

class AnnouncementsController extends GetxController {
  var announcementsServeces = AnnouncementsServeces();
  var announcementsList = [].obs;

  RxString userIdclassroom = ''.obs;

  Future<String> getUserClassRoom() async {
    userIdclassroom.value = await announcementsServeces.getUserClassroom();
    update();
    return userIdclassroom.value;
  }

  @override
  void onInit() {
    getUserClassRoom();
    super.onInit();
  }
}
