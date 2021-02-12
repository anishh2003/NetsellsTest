import 'package:flutter/material.dart';
import 'constants.dart';
import 'services/networking.dart';

class SubRedditPosts extends StatefulWidget {
  final String subRedditUrl;
  SubRedditPosts({this.subRedditUrl});

  @override
  _SubRedditPostsState createState() => _SubRedditPostsState();
}

class _SubRedditPostsState extends State<SubRedditPosts> {
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

    setState(() {
      subRedditData = networkProductData;
    });

    print(subRedditData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Reddit Sub Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Expanded(
                child: ListView(
              children: [
                Text(
                  subRedditData == null
                      ? 'Loading...'
                      : subRedditData[0]['data']['children'][0]['data']
                          ['title'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(subRedditData == null
                    ? ' '
                    : subRedditData[0]['data']['children'][0]['data']
                        ['selftext']),
                SizedBox(
                  height: 20.0,
                  child: Divider(
                    //height: 10.0,
                    thickness: 2.0,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  child: Text(
                    'Comments ',
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  child: Divider(
                    //height: 10.0,
                    thickness: 2.0,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(
                  height: 300.0,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Card(
                            child: ListTile(
                              title: Text(
                                  'Author: ${subRedditData[1]['data']['children'][index]['data']['author']}'),
                              subtitle: Text(subRedditData[1]['data']
                                  ['children'][index]['data']['body']),
                            ),
                            color: Colors.white70,
                          )
                        ],
                      );
                    },
                    itemCount: subRedditData == null
                        ? 0
                        : subRedditData[1]['data']['children'].length,
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
