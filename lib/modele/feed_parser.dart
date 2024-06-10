import 'package:http/http.dart' as http;
import 'package:webfeed/domain/rss_feed.dart';

import 'package:france_bleu_rss/modele/article.dart';

class FeedParser {

  Future<List<Article>> getFeed(String urlString) async {
    List<Article> articles = [];

    final client = http.Client();
    final url = Uri.parse(urlString);
    final clientResponse = await client.get(url);
    final rssFeed = RssFeed.parse(clientResponse.body);
    final items = rssFeed.items;
    if (items != null) {
        articles = items.map((item) => Article(item: item)).toList();
    }
    return articles;
  }
}