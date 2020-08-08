import 'package:flutter/material.dart';
import 'package:flutterappstarter/conf_password.dart';

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

  // floating onPressed function
  void _incrementCounter() {
    setState(() {
      // Listを追加する
      titleList.add("追加されたList");
    });
  }

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
              onTap: () {
                Navigator.push(
                    // 画面をStack構造で管理する
                    context,
                    MaterialPageRoute(builder: (context) => ConfPassword()
                        //AddPassword(titleList[index]) // 遷移先を指定
                        ));
              }, // item押下時に画面センチする
            ),
            Divider(),
          ]);
        },
        itemCount: titleList.length, // loopCount
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
