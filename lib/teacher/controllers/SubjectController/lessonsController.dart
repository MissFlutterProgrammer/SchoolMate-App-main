// ignore_for_file: file_names, invalid_use_of_protected_member

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:school_management_system/student/models/Subjects/SubjectsModel.dart';
import 'package:school_management_system/teacher/model/subject/LessonsResponseModels.dart';
import 'package:school_management_system/teacher/resources/TsubjectsServices/TlessonsServices.dart';

class TLessonsController extends GetxController {
  var lessonService = TLessonsServices();
  var subjectID = ''.obs;
  var lessonslist = [].obs;

  var numberOflessons = 0.obs;
  var numberOfTakenLessons = 0.obs;
  var addlessoncontroller = TextEditingController().obs;

  getLessonnForSubject() async {
    LessonsResponseModel item = await lessonService.getLessons(
      subjectID.value.toString(),
    );
    lessonslist.value = item.lessons;
    numberOflessons.value = item.numberOflesson;
    numberOfTakenLessons.value = item.numberOfTakenLessons;
  }

  addlesson() async {
    await lessonService.addNewLesson(
      lessonModel(
        title: addlessoncontroller.value.text.toString(),
        checked: false,
        subjectid: subjectID.value.toString(),
      ),
    );
  }

  updateCheckBox(int index) {
    lessonslist.value[index - 1].checked =
        !lessonslist.value[index - 1].checked;
    update();
  }
}
