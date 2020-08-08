import 'package:flutter/material.dart';

class AddPassword extends StatefulWidget {
  final String title;

  AddPassword(this.title);

  @override
  _AddPasswordState createState() => _AddPasswordState();
}

class _AddPasswordState extends State<AddPassword> {
  var _showPassword = true; // 表示切替
  var _passwordController = TextEditingController(); // 入力値や選択領域を取得する

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("パスワード追加"),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          // 縦
          children: <Widget>[
            Row(
              // 横
              children: <Widget>[
                _editingGuide('タイトル'),
                Container(
                  width: 250,
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Title Name", hintText: "ex) GitHubAccount"),
                  ),
                ),
              ],
            ),

            _margin(5.0),

            Row(
              // 横
              children: <Widget>[
                _editingGuide('ID'),
                Container(
                  width: 250,
                  child: TextField(
                    decoration:
                        InputDecoration(labelText: "ID", hintText: "ex) asas"),
                  ),
                ),
              ],
            ),

            _margin(5.0),

            Row(
              // 横
              children: <Widget>[
                _editingGuide('パスワード'),
                Container(
                  width: 250,
                  child: TextField(
                    // password用の見えない処理
                    obscureText: _showPassword,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: "password",
                      hintText: "ex) 12345",
                      suffixIcon: Icon(_showPassword
                          ? Icons.remove_red_eye
                          : Icons.panorama_fish_eye),
                    ),
                  ),
                ),
              ],
            ),

            _margin(30.0),

            // 追加ボタン
            _addButton("追加", Colors.white),
          ],
        ),
      ),
    );
  }

  ///
  /// 余白
  /// @param size サイズ
  Widget _margin(double size) {
    return Padding(
      padding: EdgeInsets.all(size),
    );
  }

  ///
  /// 編集内容のタイトル
  /// @param text
  ///
  Widget _editingGuide(String text) {
    return Container(
      width: 100,
      child: Text(text),
    );
  }

  ///
  /// addButton
  /// @param text 表示文字
  /// @param color 表示文字色
  /// 今回はボタンは多様しないようなのでSizedBoxを使用しサイズ調整する
  /// TODO その他の設定は使いまわすようであれば引数に設定する
  ///
  Widget _addButton(String text, Color color) {
    return SizedBox(
        width: double.infinity, // specific value
        child: RaisedButton(
          child: Text(
            text,
            style: TextStyle(
              color: color,
            ),
          ),
          color: Colors.blue, // Button Color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          onPressed: () {},
        ));
  }
}
