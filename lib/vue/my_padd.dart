import 'package:flutter/cupertino.dart';

class Padd extends StatelessWidget {

  final double value;
  Padd({required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(value)
    );
  }
}