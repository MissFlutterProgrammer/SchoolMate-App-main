// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Skilton extends StatelessWidget {
  const Skilton({super.key, this.height, this.width, this.decoration});
  final height;
  final width;
  final decoration;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: decoration,
    );
  }
}
