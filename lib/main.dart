import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutterappstarter/add_password.dart';
import 'package:flutterappstarter/conf_password.dart';
import 'package:flutterappstarter/item_resource.dart';

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
  SlidableController slidableController;
  final List<String> _titleList = ItemStore().getList('t');
  final List<String> _idList = ItemStore().getList('i');
  final List<String> _passwordList = ItemStore().getList('p');
  @protected
  void initState() {
    slidableController = SlidableController(
      onSlideAnimationChanged: handleSlideAnimationChanged,
      onSlideIsOpenChanged: handleSlideIsOpenChanged,
    );
    super.initState();
  }

  // スライド中のfloatingActionButtonのアニメーション
  Animation<double> _rotationAnimation;
  Color _fabColor = Colors.blue;

  void handleSlideAnimationChanged(Animation<double> slideAnimation) {
    setState(() {
      _rotationAnimation = slideAnimation;
    });
  }

  void handleSlideIsOpenChanged(bool isOpen) {
    setState(() {
      _fabColor = isOpen ? Colors.green : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("パスワード管理"),
      ),
      body: Center(
        child: OrientationBuilder(
          builder: (context, orientation) => _buildList(
              context,
              orientation == Orientation.portrait
                  ? Axis.vertical
                  : Axis.horizontal),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _fabColor,
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
        child: _rotationAnimation == null
            ? Icon(Icons.add)
            : RotationTransition(
                turns: _rotationAnimation,
                child: Icon(Icons.add),
              ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  ///
  /// リストを表示
  ///
  Widget _buildList(BuildContext context, Axis direction) {
    return ListView.builder(
      scrollDirection: direction,
      itemBuilder: (context, index) {
        final Axis slidableDirection = Axis.horizontal;
        // アイテム数によって変化する
        return _getLists(context, index, slidableDirection);
      },
      itemCount: _getListLength(), // loopCount
    );
  }

  ///
  /// 生成リスト取得
  ///
  Widget _getLists(BuildContext context, int index, Axis direction) {
    return Slidable.builder(
      key: Key(_titleList[index]),
      controller: slidableController,
      direction: direction,
      dismissal: SlidableDismissal(
        child: SlidableDrawerDismissal(),
        closeOnCanceled: true,
        //onWillDismiss: ,
        onDismissed: (actionType) {
          _showSnackBar(
              // SnackBar表示
              context,
              actionType == SlideActionType.primary // reference参考
                  ? 'Dismiss Archive'
                  : 'Dimiss Delete');
          setState(() {
            ItemStore().delete(index);
          });
        },
      ),
      actionPane: _getActionPane(index),
      actionExtentRatio: 0.25,
      child: Column(children: <Widget>[
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
      ]),
      actionDelegate: SlideActionBuilderDelegate(
          actionCount: 2,
          builder: (context, index, animation, renderingMode) {
            if (index == 0) {
              return IconSlideAction(
                caption: 'ID',
                color: renderingMode == SlidableRenderingMode.slide
                    ? Colors.blue.withOpacity(animation.value)
                    : (renderingMode == SlidableRenderingMode.dismiss
                        ? Colors.blue
                        : Colors.green),
                icon: Icons.content_copy,
                onTap: () async {
                  final data = ClipboardData(text: _idList[index]);
                  await Clipboard.setData(data);
                  _showSnackBar(context, 'IDコピー');
                },
              );
            } else {
              return IconSlideAction(
                caption: 'PW',
                color: renderingMode == SlidableRenderingMode.slide
                    ? Colors.indigo.withOpacity(animation.value)
                    : Colors.indigo,
                icon: Icons.content_copy,
                onTap: () async {
                  final data = ClipboardData(text: _passwordList[index - 1]);
                  await Clipboard.setData(data);
                  _showSnackBar(context, 'PWコピー');
                },
              );
            }
          }),
      secondaryActionDelegate: SlideActionBuilderDelegate(
          actionCount: 1,
          builder: (context, index, animation, renderingMode) {
            return IconSlideAction(
              caption: 'Delete',
              color: renderingMode == SlidableRenderingMode.slide
                  ? Colors.red.withOpacity(animation.value)
                  : Colors.red,
              icon: Icons.delete,
              onTap: () {
                setState(() {
                  ItemStore().delete(index);
                });
                _showSnackBar(context, 'Delete');
              },
            );
          }),
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

  ///
  /// ActionPane取得
  /// 勉強のため4種類のPaneを順に設定する
  ///
  static Widget _getActionPane(int index) {
    switch (index % 4) {
      case 0:
        return SlidableBehindActionPane();
      case 1:
        return SlidableStrechActionPane();
      case 2:
        return SlidableScrollActionPane();
      case 3:
        return SlidableDrawerActionPane();
      default:
        return null;
    }
  }

  void _showSnackBar(BuildContext context, String text) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
