import 'package:flutter/material.dart';

class Location extends StatelessWidget {
  static const String routeName = "Location";
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Maps")));
  }
}
