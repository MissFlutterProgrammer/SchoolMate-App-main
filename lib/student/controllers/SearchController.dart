// ignore_for_file: file_names, invalid_use_of_protected_member, avoid_print

import 'package:get/get.dart';
import 'package:school_management_system/student/resources/chat/chat_api.dart';

class SearchController extends GetxController {
  bool searchStatus = true;
  var searchResult = [].obs;

  loadSearchByName(String name) async {
    searchStatus = false;
    searchResult.value = await FirebaseApi.LoadNameFromApi(name);
    print(searchResult.value);

    searchStatus = true;
  }
}
