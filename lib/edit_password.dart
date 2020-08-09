import 'package:flutter/material.dart';

///
/// EditPassword
/// 選択したアイテムの情報を編集する画面
///
class EditPassword extends StatefulWidget {
  @override
  _EditPasswordState createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("パスワード編集"),
      ),
    );
  }
}
