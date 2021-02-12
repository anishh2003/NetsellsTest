import 'package:flutter/material.dart';
import 'reddit_posts_page.dart';

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
      home: RedditPosts(),
    );
  }
}
