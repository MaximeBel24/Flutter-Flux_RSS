import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed/domain/rss_feed.dart';

import 'article.dart';

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
      home: const MyHomePage(title: 'Mon Flux RSS'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Article> articles = [];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: const Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Nombre d\'articles : ${articles.length}',),
          ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getFeed,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
    ),
    );
  }

  getFeed() async {
    final String urlString = "https://www.francebleu.fr/rss/a-la-une.xml";
    final client = http.Client();
    final url = Uri.parse(urlString);
    final clientResponse = await client.get(url);
    final rssFeed = RssFeed.parse(clientResponse.body);
    final items = rssFeed.items;
    if (items != null) {
      setState(() {
        articles = items.map((item) => Article(item: item)).toList();
      });
    }
  }
}
