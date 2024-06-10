import 'package:flutter/material.dart';
import 'package:france_bleu_rss/controller/feed_controller.dart';

class HomeController extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mon flux RSS")),
      body: FeedController(),
    );
  }
}