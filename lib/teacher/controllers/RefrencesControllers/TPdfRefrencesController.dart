// ignore_for_file: file_names

import 'package:get/get.dart';
import '../../resources/TAdjunctsServices/TAdjunctsServices.dart';

class TRefrencesPdfController extends GetxController {
  var refServicses = TAdjunctsServices();
  var pdfList =
      [
        /* RefrencesFiles(fileName: 'Hell', subject: 'programming'),
    RefrencesFiles(fileName: 'Nothings', subject: 'Math'),
    RefrencesFiles(fileName: 'bruh', subject: 'Art'),*/
      ].obs;

  getPdfFiles() async {
    pdfList.value = await refServicses.getPdfFiles();
  }
}
