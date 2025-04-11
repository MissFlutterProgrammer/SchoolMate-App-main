import 'package:flutter/material.dart';
import 'package:school_management_system/public/utils/font_style.dart';
import '../utils/constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({required Function press, super.key}) : _press = press;

  final Function _press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _press.call(),
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        height: 52,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: gradientColor,
        ),
        child: Center(
          child: Text(
            'log in',
            style: sfMediumStyle(fontSize: 24, color: white),
          ),
        ),
      ),
    );
  }
}
