import 'package:flutter/material.dart';
import 'package:france_bleu_rss/controller/feed_controller.dart';

import '../modele/rss_type.dart';

class HomeController extends StatelessWidget {

  List<RssType> types = [
    RssType(type: "Infos", url: "https://www.francebleu.fr/rss/infos.xml"),
    RssType(type: "Sport", url: "https://www.francebleu.fr/rss/sports.xml"),
    RssType(type: "Culture", url: "https://www.francebleu.fr/rss/culture.xml"),
    RssType(type: "Vie quotidienne", url: "https://www.francebleu.fr/rss/vie-quotidienne.xml"),
    RssType(type: "Émissions", url: "https://www.francebleu.fr/rss/emissions.xml"),
  ];
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: types.length,
        child: Scaffold(
          appBar: AppBar(
              title: const Text("Mon flux RSS"),
              bottom: TabBar(tabs: types.map((type) => Tab(text: type.type,)).toList()),
          ),
          body: TabBarView(children: types.map((type) => FeedController(url: type.url)).toList(),),
        )
    );
  }
}