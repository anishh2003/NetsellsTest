import 'package:flutter/material.dart';
import 'services/networking.dart';
import 'constants.dart';

class FetchRedditPosts extends StatefulWidget {
  @override
  _FetchRedditPostsState createState() => _FetchRedditPostsState();
}

class _FetchRedditPostsState extends State<FetchRedditPosts> {
  var redditPostData;

  @override
  void initState() {
    super.initState();
    getNetworkData();
  }

  void getNetworkData() async {
    NetworkHelper networkHelper = NetworkHelper('$redditURL/r/FlutterDev.json');

    var networkProductData = await networkHelper.getData();

    redditPostData = networkProductData;

    print(networkProductData);
    //goRedditPostPage();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
