import 'package:flutter/material.dart';

class AddPassword extends StatefulWidget {
  final String title;
  AddPassword(this.title);

  @override
  _AddPasswordState createState() => _AddPasswordState();
}

class _AddPasswordState extends State<AddPassword> {
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
                  width: 80,
                  child: Text('タイトル'),
                ),
                Container(
                  width: 20,
                  child: Text(':'),
                ),
                Text('テストタイトル')
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
                  width: 80,
                  child: Text('ID'),
                ),
                Container(
                  width: 20,
                  child: Text(':'),
                ),
                Text('テストID')
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
                  width: 80,
                  child: Text('PW'),
                ),
                Container(
                  width: 20,
                  child: Text(':'),
                ),
                Text('テストPW')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
