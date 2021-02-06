import 'package:flutter/material.dart';
import 'constants.dart';
import 'services/networking.dart';
import 'subreddit_posts_page.dart';

class FetchSubRedditPosts extends StatefulWidget {
  final String subRedditUrl;
  FetchSubRedditPosts({this.subRedditUrl});

  @override
  _FetchSubRedditPostsState createState() => _FetchSubRedditPostsState();
}

class _FetchSubRedditPostsState extends State<FetchSubRedditPosts> {
  var subRedditData;

  @override
  void initState() {
    super.initState();
    getNetworkData();
  }

  void getNetworkData() async {
    NetworkHelper networkHelper =
        NetworkHelper('$redditURL${widget.subRedditUrl}.json');

    var networkProductData = await networkHelper.getData();
    subRedditData = networkProductData;

    print(subRedditData);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SubRedditPostPage(
          subRedditData: subRedditData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
