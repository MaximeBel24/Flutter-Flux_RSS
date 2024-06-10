import 'package:flutter/material.dart';
import 'package:france_bleu_rss/controller/feed_controller.dart';
import 'package:france_bleu_rss/controller/home_controller.dart';
import 'package:france_bleu_rss/modele/feed_parser.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed/domain/rss_feed.dart';
import 'package:intl/intl.dart';

import 'package:france_bleu_rss/modele/article.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: HomeController()
    );
  }
}
