import 'package:flutter/material.dart';

class RedditPostPage extends StatefulWidget {
  final redditPageData;

  RedditPostPage({this.redditPageData});
  @override
  _RedditPostPageState createState() => _RedditPostPageState();
}

class _RedditPostPageState extends State<RedditPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reddit Posts Page'),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                  'author : ${widget.redditPageData['data']['children'][index]['data']['author']}'),
              subtitle: Text(widget.redditPageData['data']['children'][index]
                  ['data']['title']),
            ),
          );
        },
        itemCount: widget.redditPageData['data']['children'].length,
      ),
    );
  }
}
