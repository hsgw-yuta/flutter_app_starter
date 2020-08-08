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
                Container(
                  width: 80,
                  child: Text('タイトル'),
                ),
                Container(
                  width: 250,
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Title Name", hintText: "ex) GitHubAccount"),
                  ),
                ),
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
                  width: 250,
                  child: TextField(
                    decoration:
                        InputDecoration(labelText: "ID", hintText: "ex) asas"),
                  ),
                ),
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
          ],
        ),
      ),
    );
  }
}
