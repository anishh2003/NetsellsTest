import 'package:flutter/material.dart';
import 'services/networking.dart';
import 'constants.dart';
import 'sub_reddit_posts.dart';

class RedditPosts extends StatefulWidget {
  @override
  _RedditPostsState createState() => _RedditPostsState();
}

class _RedditPostsState extends State<RedditPosts> {
  var redditData;

  @override
  void initState() {
    super.initState();
    getNetworkData();
  }

  void getNetworkData() async {
    NetworkHelper networkHelper = NetworkHelper('$redditURL/r/FlutterDev.json');

    var networkProductData = await networkHelper.getData();

    setState(() {
      redditData = networkProductData;
    });
  }

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
                  'author : ${redditData['data']['children'][index]['data']['author']}'),
              subtitle:
                  Text(redditData['data']['children'][index]['data']['title']),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FetchSubRedditPosts(
                      subRedditUrl: redditData['data']['children'][index]
                          ['data']['permalink'],
                    ),
                  ),
                );
              },
            ),
          );
        },
        itemCount:
            redditData == null ? 0 : redditData['data']['children'].length,
      ),
    );
  }
}
