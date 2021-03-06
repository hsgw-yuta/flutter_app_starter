import 'package:flutter/material.dart';

class AddPassword extends StatefulWidget {
  @override
  _AddPasswordState createState() => _AddPasswordState();
}

class _AddPasswordState extends State<AddPassword> {
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
      resizeToAvoidBottomPadding: false, // リサイズの固定
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
                      obscureText: _showPassword,
                      controller: _passwordController,
                      decoration: InputDecoration(
                          labelText: "Password",
                          suffixIcon: IconButton(
                            icon: Icon(_showPassword
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              this.setState(() {
                                _showPassword = !_showPassword;
                              });
                            },
                          )),
                    )),
              ],
            ),

            _margin(standardInterval),

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
      width: editingGuideSize,
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
      child: SingleChildScrollView(
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
          onPressed: () {
            _backScreen();
          },
        ),
      ),
    );
  }

  ///
  /// 一つ前の画面に戻る
  ///
  void _backScreen() {
    final List<String> res = [
      _titleController.text,
      _idController.text,
      _passwordController.text
    ];
    Navigator.of(context).pop(res);
  }
}
