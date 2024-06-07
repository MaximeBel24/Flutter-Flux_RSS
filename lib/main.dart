import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed/domain/rss_feed.dart';
import 'package:intl/intl.dart';

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
      body: ListView.separated(
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
                        Spacer(),
                        Text(readableDate(article.date))
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                      child: Image.network(
                        article.imageUrl,
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height / 4,
                      ),
                    ),
                    Text(article.title),
                    Padding(
                        padding: EdgeInsets.only(top: 10),
                    ),
                    Text(article.description)
                  ],
                ),
              ),
            );
          },
          separatorBuilder: ((context, index) => const Divider()),
          itemCount: articles.length
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getFeed,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
    ),
    );
  }

  String readableDate(DateTime dateTime) {
    DateFormat dateFormat = DateFormat.yMMMMEEEEd();
    String string = dateFormat.format(dateTime);
    return string;
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
