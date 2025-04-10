// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school_management_system/public/utils/constant.dart';
import 'package:school_management_system/public/utils/font_style.dart';
import 'package:school_management_system/student/models/Adjuncts/refrencesChipsdata.dart';
import 'package:school_management_system/teacher/controllers/RefrencesControllers/TrefrenceBottomSheetController.dart';
import 'package:school_management_system/teacher/view/Adjuncts/TQuizz.dart';
import 'package:school_management_system/teacher/view/Adjuncts/TVideos.dart';
import 'package:school_management_system/teacher/view/Adjuncts/TeacherPdfRefrences.dart';
import 'package:school_management_system/teacher/view/Adjuncts/component/Buttonsstatus.dart';
import 'package:school_management_system/teacher/view/tasks/TeacherTasksPage.dart';

class TeacherAdjuncts extends StatefulWidget {
  const TeacherAdjuncts({super.key});

  @override
  State<TeacherAdjuncts> createState() => _TeacherAdjunctsState();
}

class _TeacherAdjunctsState extends State<TeacherAdjuncts> {
  int _index = 0;
  final adjunctsPage = [TeacherPdfRefrences(), TQuizz(), TVideos()];
  @override
  late BuildContext context;

  final _chips = [
    ChipsData(label: 'Refrences'),
    ChipsData(label: 'Quizzes'),
    ChipsData(label: 'Videos'),
  ];

  @override
  Widget build(BuildContext context) {
    var buttons = ButtonsFunctions();

    return Scaffold(
      backgroundColor: backgroundColor,
      /*appBar: CostumAppBar(
        title: 'Adjuncts',
        style: redHatLightStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),*/
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 40.w, right: 40.w, top: 24.h),
              child: chosePageBar(),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 116.5.w,
                right: 116.5.w,
                top: 24.h,
                bottom: 15.h,
              ),
              child: const Divider(color: Color(0xFFD4D4D4)),
            ),
            SizedBox(height: 24.h),
            GetBuilder<TreferenceBottomsheetController>(
              init: TreferenceBottomsheetController(),
              builder: (controller) {
                return AddFileButton(
                  label: buttons.getButtons(_index, context).label,
                  onTap: buttons.getButtons(_index, context).onTap,
                );
              },
            ),
            SizedBox(
              height: 555.h,
              child: adjunctsPage[_index], //adjunctsPage[_index],
            ),
          ],
        ),
      ),
    );
  }

  Container chosePageBar() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade100,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          _chips.length,
          (index) => ChoiceChip(
            label: Text(_chips[index].label.toString()),
            labelStyle:
                (_index == index)
                    ? redHatBoldStyle(fontSize: 12, color: Colors.white)
                    : redHatBoldStyle(fontSize: 12, color: Colors.grey),
            selected: _index == index,
            selectedColor: primaryColor,
            backgroundColor: Colors.white10,
            onSelected: (bool select) {
              setState(() {
                _index = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
