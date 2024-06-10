import 'package:flutter/material.dart';
import 'package:france_bleu_rss/vue/tile_view.dart';

import '../modele/article.dart';

class ListVue extends StatelessWidget{
  final List<Article> articles;

  const ListVue({required this.articles});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: ((context, index) => TileView(article: articles[index])),
        separatorBuilder: ((context, index) => const Divider()),
        itemCount: articles.length
    );
  }
}