import 'package:flutter/material.dart';
import 'services/networking.dart';
import 'constants.dart';
import 'reddit_posts_page.dart';

class FetchRedditPosts extends StatefulWidget {
  @override
  _FetchRedditPostsState createState() => _FetchRedditPostsState();
}

class _FetchRedditPostsState extends State<FetchRedditPosts> {
  var redditData;

  @override
  void initState() {
    super.initState();
    getNetworkData();
  }

  void getNetworkData() async {
    NetworkHelper networkHelper = NetworkHelper('$redditURL/r/FlutterDev.json');

    var networkProductData = await networkHelper.getData();

    redditData = networkProductData;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RedditPostPage(
          redditPageData: redditData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
