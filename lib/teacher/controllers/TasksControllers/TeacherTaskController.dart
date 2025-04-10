// ignore_for_file: file_names, avoid_print

import 'package:get/state_manager.dart';
import 'package:school_management_system/teacher/resources/TaskServices/TaskServices.dart';

class TeacherTasksController extends GetxController {
  var taskServices = TaskServices();

  var tasksList = [].obs;

  getTasks() async {
    tasksList.clear();
    tasksList.value = await taskServices.getteacherTasks();
  }

  deleteTask(String id) async {
    print('dele controller');
    await taskServices.deleteTask(id);
    update();
  }

  updateList() {
    update();
  }
}
