import 'package:flutter/material.dart';
import 'package:france_bleu_rss/vue/title_text.dart';

import '../modele/article.dart';
import 'date_row.dart';
import 'description_text.dart';
import 'image_view.dart';

class TileView extends StatelessWidget{

  final Article article;

  TileView({required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => print("Tapé sur : ${article.title}")),
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            DateRow(date: article.date),
            ImageView(imageUrl: article.imageUrl),
            TitleText(title: article.title),
            const Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            DescriptionText(description: article.description,)
          ],
        ),
      ),
    );
  }
}