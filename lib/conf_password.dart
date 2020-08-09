import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterappstarter/edit_password.dart';

// パスワード確認画面
class ConfPassword extends StatefulWidget {
  final int index;
  final String title;
  final String id;
  final String pass;

  ConfPassword(this.index, this.title, this.id, this.pass);

  @override
  _ConfPasswordState createState() => _ConfPasswordState();
}

class _ConfPasswordState extends State<ConfPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          // 編集Iconを表示
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () async {
              // 押下時編集画面へ遷移する
              final result = await Navigator.push(
                  // 画面をStack構造で管理する
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditPassword(
                          widget.index, widget.title, widget.id, widget.pass)));
            },
          ),
        ],
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
              onPressed: () async {
                final data = ClipboardData(text: widget.id);
                await Clipboard.setData(data);
                //_createSnackBar("IDコピー");
              },
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
              onPressed: () async {
                final data = ClipboardData(text: widget.pass);
                await Clipboard.setData(data);
                //_createSnackBar("パスワードコピー");
              },
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
                _backScreen(); // 画面戻る
              },
            )),
      ],
    );
  }

  // 一つ前の画面に戻る
  void _backScreen() {
    Navigator.of(context).pop(widget.index);
  }

//  void _createSnackBar(String text) {
//    final snackBar = SnackBar(
//      content: Text(text),
//      action: SnackBarAction(
//        label: 'とじる',
//        onPressed: () {
//          Scaffold.of(context).removeCurrentSnackBar();
//        },
//      ),
//      duration: Duration(seconds: 3),
//    );
//    Scaffold.of(context).showSnackBar(snackBar);
//  }
}
