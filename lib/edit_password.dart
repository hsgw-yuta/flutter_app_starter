import 'package:flutter/material.dart';
import 'package:flutterappstarter/item_resource.dart';

///
/// EditPassword
/// 選択したアイテムの情報を編集する画面
///
class EditPassword extends StatefulWidget {
  final int index;

  EditPassword(this.index);

  @override
  _EditPasswordState createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  final double textFieldWidth = 250;
  final double editingGuideSize = 100;
  final double standardInterval = 30.0;
  final double shortInterval = 5.0;

  var _showPassword = true; // 表示切替
  var _titleController = new TextEditingController(); // title value
  var _idController = new TextEditingController();
  var _passwordController = new TextEditingController(); // password value

  final List<String> _titleList = ItemStore().getList('t');
  final List<String> _idList = ItemStore().getList('i');
  final List<String> _passList = ItemStore().getList('p');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // TextEditingController　init
    _titleController.text = _titleList[widget.index];
    _idController.text = _idList[widget.index];
    _passwordController.text = _passList[widget.index];
  }

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
                  child: TextFormField(
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
                  child: TextFormField(
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
                    _backScreen("e", widget.index, _titleController.text,
                        _idController.text, _passwordController.text); // 画面戻る
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
  void _backScreen(
      String type, dynamic index, String title, String id, String pass) {
    final List<dynamic> res = [type, index, title, id, pass];
    Navigator.of(context).pop(res);
  }
}
