import 'package:flutter/material.dart';
import 'package:flutterappstarter/add_password.dart';

import 'conf_password.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  List<String> titleList = ['Amazon', '楽天', 'Yahoo!'];
  Map<String, String> accountMap = {
    'amazon': "A",
    'rakuten': "R",
    'yahoo!': "Y"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("パスワード管理"),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Column(children: <Widget>[
            ListTile(
              leading: Icon(Icons.vpn_key),
              title: Text(titleList[index]),
              onTap: () async {
                final _idList = accountMap.keys.toList();
                final _passList = accountMap.values.toList();
                final result = await Navigator.push(
                    // 画面をStack構造で管理する
                    context,
                    MaterialPageRoute(
                        builder: (context) => ConfPassword(
                            index, _idList[index], _passList[index])));
                if (result != null) {
                  setState(() {
                    _mapTest();
                    // mapをlistに変換
                    final mapList = accountMap.keys.toList();

                    // delete List&Map
                    titleList.removeAt(result);
                    accountMap.remove(mapList[result]);
                    _mapTest();
                  });
                }
              }, // item押下時に画面センチする
            ),
            Divider(),
          ]);
        },
        itemCount: titleList.length, // loopCount
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPassword()));

          // popされた値を確認
          if (result != null) {
            setState(() {
              final Map<String, String> map = {result[1]: result[2]};
              titleList.add(result[0]);
              accountMap.addAll(map);
              _mapTest();
            });
          }
        },
        tooltip: 'Add',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _mapTest() {
    print(titleList);
    print(accountMap);
  }
}
