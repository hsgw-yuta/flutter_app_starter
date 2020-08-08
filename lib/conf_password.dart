import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// パスワード確認画面
class ConfPassword extends StatefulWidget {
  final int index;

  ConfPassword(this.index);

  @override
  _ConfPasswordState createState() => _ConfPasswordState();
}

class _ConfPasswordState extends State<ConfPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("パスワード確認"),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Center(
          child: buttons(context),
        ),
      ),
    );
  }

  // 表示ボタン群
  Widget buttons(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
            width: double.infinity, // match_parent
            height: 50,
            child: RaisedButton(
              child: Text("IDを表示"),
              color: Colors.white,
              shape: StadiumBorder(
                side: BorderSide(color: Colors.black),
              ),
              onPressed: () {},
            )),
        Padding(
          padding: EdgeInsets.all(15.0),
        ),
        SizedBox(
            width: double.infinity, // match_parent
            height: 50,
            child: RaisedButton(
              child: Text("パスワードを表示"),
              color: Colors.white,
              shape: StadiumBorder(
                side: BorderSide(color: Colors.black),
              ),
              onPressed: () {},
            )),
        Padding(
          padding: EdgeInsets.all(20.0),
        ),
        SizedBox(
            width: double.infinity, // match_parent
            height: 50,
            child: RaisedButton(
              child: Text(
                "削除",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red,
              shape: StadiumBorder(
                side: BorderSide(color: Colors.white),
              ),
              onPressed: () {
                _basckScreen(); // 画面戻る
              },
            )),
      ],
    );
  }

  // 一つ前の画面に戻る
  void _basckScreen() {
    Navigator.of(context).pop(widget.index);
  }
}
