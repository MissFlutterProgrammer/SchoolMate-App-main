// ignore_for_file: file_names, invalid_use_of_protected_member, prefer_typing_uninitialized_variables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school_management_system/teacher/controllers/RefrencesControllers/TrefrenceBottomSheetController.dart';
import '../../../../public/utils/constant.dart';
import '../../../../public/utils/font_families.dart';

var _controller = Get.find<TreferenceBottomsheetController>();

class TrefChosingGradeBar extends StatelessWidget {
  const TrefChosingGradeBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      width: 428.w,
      child: GetBuilder<TreferenceBottomsheetController>(
        init: TreferenceBottomsheetController(),
        builder: ((controller) => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _controller.gradeList.value.length,
              itemBuilder: (BuildContext context, int index) {
                return GradeOption(
                  grade: _controller.gradeList.value[index],
                  index: index + 1,
                );
              },
            )),
      ),
    );
  }
}

class GradeOption extends StatelessWidget {
  const GradeOption({this.grade, super.key, this.index});

  final grade;
  final index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.w),
      child: Column(
        children: [
          SizedBox(
            height: 25.h,
            width: 25.w,
            child: Radio<int>(
              value: index,
              groupValue: _controller.currentGrade.value,
              onChanged: (int? newIndex) {
                print('Hello from here ');
                _controller.updateGreadeIndex(newIndex!);
              },
              activeColor: primaryColor,
            ),
          ),
          SizedBox(height: 5.h),
          SizedBox(
            height: 25.h,
            width: 25.w,
            child: Center(
              child: Text(
                '$grade',
                style: TextStyle(
                  color: gray,
                  fontFamily: RedHatDisplay.medium,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
