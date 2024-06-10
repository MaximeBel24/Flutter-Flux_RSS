import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:france_bleu_rss/modele/feed_parser.dart';

import '../modele/article.dart';

class FeedController extends StatelessWidget {
  
  
  Widget build(BuildContext context) {
    return FutureBuilder<List<Article>>(
        future: FeedParser().getFeed(),
        builder: (context, snapshot) {
          final articles = snapshot.data ?? [];
          return ListView.separated(
              itemBuilder: (context, index) {
                final article = articles[index];
                return InkWell(
                  onTap: (() => print("Tapé sur : ${article.title}")),
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Spacer(),
                            Text(
                              article.date.toString(),
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 13
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Image.network(
                            article.imageUrl,
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height / 4,
                          ),
                        ),
                        Text(
                          article.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                        ),
                        Text(
                          article.description,
                          style: const TextStyle(
                              color: Colors.black54
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: ((context, index) => const Divider()),
              itemCount: articles.length
          );
        }
    );
  }
}