// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';

class TAnnouncementsServices {
  getAnnouncements() async {
    var stream = FirebaseFirestore.instance
        .collection('announcement')
        .where('type', isEqualTo: 'Teachers')
        .snapshots();

    return stream;
  }
}
