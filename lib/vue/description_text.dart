import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget{

  final String description;

  const DescriptionText({Key? key, required this.description}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: const TextStyle(
          color: Colors.black54
      ),
    );
  }
}