// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: camel_case_types
class pageHome extends StatefulWidget {
  const pageHome({super.key});

  @override
  State<pageHome> createState() => _pageHomeState();
}

// ignore: camel_case_types
class _pageHomeState extends State<pageHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    );
  }
}
