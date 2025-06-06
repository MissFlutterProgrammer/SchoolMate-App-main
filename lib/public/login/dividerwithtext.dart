import 'package:flutter/material.dart';

class DividerText extends StatelessWidget {
  const DividerText({required String text, super.key}) : _text = text;

  final String _text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 10, right: 20),
            child: const Divider(
              color: Colors.black,
              height: 36,
            ),
          ),
        ),
        Text(_text),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 10),
            child: const Divider(
              color: Colors.black,
              height: 36,
            ),
          ),
        ),
      ],
    );
  }
}
