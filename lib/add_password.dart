import 'package:flutter/material.dart';

class NextPage extends StatefulWidget {
  final String title;
  NextPage(this.title);

  @override
  _State createState() => _State();
}

class _State extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          // 縦
          children: <Widget>[
            Row(
              // 横
              children: <Widget>[
                Container(
                  width: 50,
                  child: Text('ID'),
                ),
                Container(
                  width: 20,
                  child: Text(':'),
                ),
                Text('毎回同じテキストを表示ID')
              ],
            ),

            // 余白
            Padding(
              padding: EdgeInsets.all(5.0),
            ),

            Row(
              // 横
              children: <Widget>[
                Container(
                  width: 50,
                  child: Text('PW'),
                ),
                Container(
                  width: 20,
                  child: Text(':'),
                ),
                Text('毎回同じテキストを表示PW')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
