import 'package:flutter/material.dart';
import 'dart:convert';

class TitleText extends StatelessWidget {

  final String title;

  const TitleText({Key? key, required this.title}): super(key: key);

  @override
  Widget build(BuildContext context) {

    List<int> bytes = utf8.encode(title);
    String decoded = utf8.decode(bytes);

    return Text(
      decoded,
      textAlign: TextAlign.center,
      style: const TextStyle(
          color: Colors.blue,
          fontSize: 18,
          fontWeight: FontWeight.bold
      ),
    );
  }
}