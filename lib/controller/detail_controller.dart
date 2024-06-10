import 'package:flutter/material.dart';
import 'package:france_bleu_rss/vue/description_text.dart';
import 'package:france_bleu_rss/vue/image_view.dart';
import 'package:france_bleu_rss/vue/my_padd.dart';
import 'package:france_bleu_rss/vue/title_text.dart';

import '../modele/article.dart';

class DetailController extends StatelessWidget {
  final Article article;
  DetailController({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padd(value: 10,),
            TitleText(title: article.title),
            Padd(value: 10),
            ImageView(imageUrl: article.imageUrl),
            Padd(value: 10),
            const Divider(),
            Padd(value: 10),
            DescriptionText(description: article.description),
            Padd(value: 10),
            ElevatedButton(
                onPressed: () {

                },
                child: const Text(
                    "Vers l'article complet",
                )
            )

          ],
        ),
      ),
    );
  }
}