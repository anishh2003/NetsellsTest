import 'package:flutter/material.dart';
import 'fetch_reddit_posts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.lightBlue[200],
        ),
      ),
      home: FetchRedditPosts(),
    );
  }
}
