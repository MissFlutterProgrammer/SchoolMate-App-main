// ignore_for_file: invalid_use_of_protected_member, file_names, prefer_typing_uninitialized_variables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school_management_system/public/utils/constant.dart';
import 'package:school_management_system/public/utils/font_families.dart';
import 'package:school_management_system/student/controllers/RefrencesController.dart';

final _controller = Get.put(RefrencesController());
var difficultyList = _controller.difficulty.value;

class ChosingDifficultyBar extends StatelessWidget {
  const ChosingDifficultyBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w),
      child: SizedBox(
        height: 60.h,
        width: 428.w,
        child: GetBuilder(
          init: RefrencesController(),
          builder: ((controller) => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: difficultyList.length,
                itemBuilder: (BuildContext context, int index) {
                  return DifficultyBar(
                    difficulty: difficultyList[index].difficulty,
                    index: index + 1,
                  );
                },
              )),
        ),
      ),
    );
  }
}

class DifficultyBar extends StatelessWidget {
  const DifficultyBar({super.key, this.difficulty, this.index});

  final difficulty;
  final index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.w,
      width: 100.w,
      child: Row(
        children: [
          SizedBox(
            height: 24.h,
            width: 24.w,
            child: Radio<int>(
              value: index,
              groupValue: _controller.currenDifficulty.value,
              onChanged: (int? newIndex) {
                _controller.updateDifficultyIndex(newIndex!);
                print(_controller.currenDifficulty.value);
              },
              activeColor: primaryColor,
            ),
          ),
          SizedBox(width: 7.w),
          SizedBox(
            width: 50.w,
            height: 25.h,
            child: Text(
              '$difficulty',
              style: TextStyle(
                color: gray,
                fontSize: 12,
                fontFamily: RedHatDisplay.medium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
