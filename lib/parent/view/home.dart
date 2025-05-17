import 'package:flutter/material.dart';

class HomeParent extends StatelessWidget {
  const HomeParent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text("Parent"),
        ),
      ),
    );
  }
}
