import 'package:flutter/material.dart';
import 'package:france_bleu_rss/modele/date_parser.dart';

class DateRow extends StatelessWidget {

  final DateTime date;

  const DateRow({Key? key, required this.date}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Text(
          DateParser().readableDate(date),
          style: const TextStyle(
              color: Colors.red,
              fontStyle: FontStyle.italic,
              fontSize: 13
          ),
        )
      ],
    );
  }
}