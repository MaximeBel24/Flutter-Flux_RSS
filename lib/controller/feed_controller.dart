import 'package:flutter/material.dart';
import 'package:france_bleu_rss/modele/feed_parser.dart';
import 'package:france_bleu_rss/vue/date_row.dart';
import 'package:france_bleu_rss/vue/description_text.dart';
import 'package:france_bleu_rss/vue/image_view.dart';
import 'package:france_bleu_rss/vue/list_vue.dart';
import 'package:france_bleu_rss/vue/tile_view.dart';
import 'package:france_bleu_rss/vue/title_text.dart';

import '../modele/article.dart';

class FeedController extends StatelessWidget {

  final String url;

  const FeedController({required this.url});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Article>>(
        future: FeedParser().getFeed(url),
        builder: ((context, snapshot) => ListVue(articles: snapshot.data ?? [],))
    );
  }
}