import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterappstarter/edit_password.dart';
import 'package:flutterappstarter/item_resource.dart';

// パスワード確認画面
class ConfPassword extends StatefulWidget {
  final int index;

  ConfPassword(this.index);

  @override
  _ConfPasswordState createState() => _ConfPasswordState();
}

class _ConfPasswordState extends State<ConfPassword> {
  final List<String> _titleList = ItemStore().getList('t');
  final List<String> _idList = ItemStore().getList('i');
  final List<String> _passList = ItemStore().getList('p');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleList[widget.index]),
        actions: [
          // 編集Iconを表示
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () async {
              // 押下時編集画面へ遷移する
              final res = await Navigator.push(
                  // 画面をStack構造で管理する
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditPassword(widget.index)));
              if (res != null) {
                _backScreen('e', widget.index, res[2], res[3], res[4]);
              }
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
                final data = ClipboardData(text: _idList[widget.index]);
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
                final data = ClipboardData(text: _passList[widget.index]);
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
                _backScreen("d", widget.index, "", "", ""); // back screen
              },
            )),
      ],
    );
  }

  ///
  /// 一つ前の画面に戻る
  ///
  void _backScreen(
      String type, dynamic index, String title, String id, String pass) {
    final List<dynamic> res = [type, index, title, id, pass];
    Navigator.of(context).pop(res);
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
