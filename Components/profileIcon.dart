import 'package:flutter/material.dart';

class profileIcon extends StatefulWidget {
  const profileIcon({super.key});

  @override
  State<profileIcon> createState() => _profileIconState();
}

class _profileIconState extends State<profileIcon> {
  @override
  Widget build(BuildContext context) {
    return IconButton(icon:Icon(Icons.person_2_rounded),onPressed: (){},tooltip: "my details",);
  }
}