// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:school_management_system/public/config/user_information.dart';
import 'package:school_management_system/student/models/subject/subjectModel.dart';

class SubjectServices {
  getUserSubjects() async {
    List subjectRefrencesList = [];
    List subjectInfo = [];
    subjectRefrencesList.clear();
    subjectInfo.clear();
    try {
      await FirebaseFirestore.instance
          .collection('acadimic_year')
          .doc(UserInformation.grade.toString())
          .get()
          .then((value) {
            subjectRefrencesList = value.data()!['subject'];
          });
      for (var item in subjectRefrencesList) {
        var lessonsNumber = 0;
        var subjectName = '';
        var teacherName;
        await FirebaseFirestore.instance
            .collection('subject')
            .doc(item.toString())
            .get()
            .then((value) {
              subjectName = value.data()?['name'];
              //lessonsNumber = value.data()?['lessons'].length ?? 0;
            });
        await FirebaseFirestore.instance
            .collection('lessons')
            .where('subject', isEqualTo: item.toString())
            .get()
            .then((value) {
              lessonsNumber = value.docs.length;
            });
        await FirebaseFirestore.instance
            .collection('relation')
            .where('classrooms', arrayContains: UserInformation.classid)
            .where('subject', isEqualTo: item.toString())
            .where('grade', isEqualTo: UserInformation.grade.toString())
            .get()
            .then((value) {
              for (var element in value.docs) {
                teacherName = element.data()['teacher_name'];
              }
            });
        try {
          subjectInfo.add(
            SubjectModel(
              name: subjectName,
              teacherName: teacherName,
              id: item,
              lessonsNumber: lessonsNumber,
            ),
          );
        } catch (e) {
          return subjectInfo;
        }
      }
      return subjectInfo;
    } catch (e) {
      return [];
    }
  }
}
