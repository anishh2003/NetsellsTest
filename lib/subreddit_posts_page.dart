import 'package:flutter/material.dart';

class SubRedditPostPage extends StatefulWidget {
  final List subRedditData;

  SubRedditPostPage({this.subRedditData});
  @override
  _SubRedditPostPageState createState() => _SubRedditPostPageState();
}

class _SubRedditPostPageState extends State<SubRedditPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Reddit Sub Post'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Expanded(
                child: ListView(
              children: [
                Text(widget.subRedditData[0]['data']['children'][0]['data']
                    ['title']),
                Text(widget.subRedditData[0]['data']['children'][0]['data']
                    ['selftext']),
                SizedBox(
                  height: 20.0,
                  child: Divider(
                    //height: 10.0,
                    thickness: 2.0,
                    color: Colors.black54,
                  ),
                ),
                Expanded(
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
                                  'Author: ${widget.subRedditData[1]['data']['children'][index]['data']['author']}'),
                              subtitle: Text(widget.subRedditData[1]['data']
                                  ['children'][index]['data']['body']),
                            ),
                            color: Colors.white70,
                          )
                        ],
                      );
                    },
                    itemCount:
                        widget.subRedditData[1]['data']['children'].length,
                  ),
                ),
              ],
            ))
          ],
        ));
  }
}
