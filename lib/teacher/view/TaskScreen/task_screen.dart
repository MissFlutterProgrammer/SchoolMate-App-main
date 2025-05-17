import 'package:flutter/material.dart';
import 'package:school_management_system/public/utils/constant.dart';
import '../../../student/Widgets/CustomAppBar.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CostumAppBar(),
        body: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 40),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: white,
                    padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                  ),
                  onPressed: () {},
                  child: Text("ADD FILE + "),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
