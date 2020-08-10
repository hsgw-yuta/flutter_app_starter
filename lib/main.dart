import 'package:flutter/material.dart';
import 'package:flutterappstarter/add_password.dart';
import 'package:flutterappstarter/item_resource.dart';

import 'conf_password.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _titleList = ItemStore().getList('t');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("パスワード管理"),
      ),
      body: _createList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final res = await Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPassword()));
          if (res != null) {
            setState(() {
              ItemStore().add(res[0], res[1], res[2]);
              ItemStore().showLists();
            });
          }
        },
        tooltip: 'Add',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  ///
  /// リストを表示
  ///
  Widget _createList() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Column(children: <Widget>[
          ListTile(
            leading: Icon(Icons.vpn_key),
            title: Text(_titleList[index]),
            onTap: () async {
              final res = await Navigator.push(
                  // 画面をStack構造で管理する
                  context,
                  MaterialPageRoute(builder: (context) => ConfPassword(index)));
              if (res != null) {
                if (res[0] == 'd') {
                  setState(() {
                    ItemStore().delete(res[1]); // run delete
                    ItemStore().showLists();
                  });
                } else if (res[0] == 'e') {
                  setState(() {
                    ItemStore().update(res[1], res[2], res[3], res[4]);
                    ItemStore().showLists();
                  });
                }
              }
            }, // item押下時に画面センチする
          ),
          Divider(),
        ]);
      },
      itemCount: _getListLength(), // loopCount
    );
  }

  ///
  /// タイトルのリストサイズを取得
  ///
  _getListLength() {
    final length = ItemStore().getListLength('t');
    if (length == -1) {
      // TODO Error処理
      print("input type error");
    }
    return length;
  }
}
