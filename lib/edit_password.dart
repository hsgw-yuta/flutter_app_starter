import 'package:flutter/material.dart';

///
/// EditPassword
/// 選択したアイテムの情報を編集する画面
///
class EditPassword extends StatefulWidget {
  final int index;
  final String title;
  final String id;
  final String pass;

  EditPassword(this.index, this.title, this.id, this.pass);

  @override
  _EditPasswordState createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  final double textFieldWidth = 250;
  final double editingGuideSize = 100;
  final double standardInterval = 30.0;
  final double shortInterval = 5.0;
  var _showPassword = true; // 表示切替
  var _idController = TextEditingController();
  var _passwordController = TextEditingController(); // password value
  var _titleController = TextEditingController(); // title value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("パスワード追加"),
      ),
      body: Padding(
        padding: EdgeInsets.all(standardInterval),
        child: Column(
          // 縦
          children: <Widget>[
            Row(
              // 横
              children: <Widget>[
                _editingGuide('タイトル'),
                Container(
                  width: textFieldWidth,
                  child: TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                        labelText: "Title Name", hintText: "ex) GitHubAccount"),
                  ),
                ),
              ],
            ),

            _margin(shortInterval),

            Row(
              // 横
              children: <Widget>[
                _editingGuide('ID'),
                Container(
                  width: textFieldWidth,
                  child: TextField(
                    controller: _idController,
                    decoration:
                        InputDecoration(labelText: "ID", hintText: "ex) asas"),
                  ),
                ),
              ],
            ),

            _margin(shortInterval),

            Row(
              // 横
              children: <Widget>[
                _editingGuide('パスワード'),
                Container(
                  width: textFieldWidth,
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

            _margin(standardInterval),
            // 追加ボタン
            SizedBox(
                width: double.infinity, // match_parent
                height: 50,
                child: RaisedButton(
                  child: Text(
                    "編集",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                  shape: StadiumBorder(
                    side: BorderSide(color: Colors.white),
                  ),
                  onPressed: () {
                    _backScreen(); // 画面戻る
                  },
                )),
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
      width: 100.0,
      child: Text(text),
    );
  }

  ///
  /// 一つ前の画面に戻る
  ///
  void _backScreen() {
    Navigator.of(context).pop();
  }
}
