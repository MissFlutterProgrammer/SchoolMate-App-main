import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/constant.dart';
import '../utils/font_style.dart';

class SendEmail extends StatelessWidget {
  const SendEmail({required Function press, super.key}) : _press = press;

  final Function _press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _press.call(),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.3,
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: gradientColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/email.png'),
              height: 25,
              width: 25,
            ),
            SizedBox(width: 10.w),
            Text(
              'Send Email',
              style: sfMediumStyle(
                fontSize: 20,
                color: white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
