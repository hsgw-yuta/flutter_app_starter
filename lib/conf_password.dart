import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// パスワード確認画面
class ConfPassword extends StatefulWidget {
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
        RaisedButton(
          child: Text("IDを表示"),
          color: Colors.white,
          shape: StadiumBorder(
            side: BorderSide(color: Colors.black),
          ),
          onPressed: () {},
        ),
        // 余白
        Padding(
          padding: EdgeInsets.all(15.0),
        ),

        RaisedButton(
          child: Text("パスワードを表示"),
          color: Colors.white,
          shape: StadiumBorder(
            side: BorderSide(color: Colors.black),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
