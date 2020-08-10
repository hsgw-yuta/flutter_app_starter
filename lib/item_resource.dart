class ItemStore {
  static final List<String> _titles = ['Amazon', '楽天', 'Yahoo!'];
  static final List<String> _ids = ['amazon', 'rakuten', 'yahoo!'];
  static final List<String> _passwords = ['A', 'R', 'Y'];
  static final ItemStore _cache = ItemStore._internal();

  factory ItemStore() {
    return _cache;
  }

  ItemStore._internal();

  ///
  /// 新しいパスワード追加
  ///
  add(String title, String id, String pass) {
    // if all empty error
    if (title.isEmpty && id.isEmpty && pass.isEmpty) {
      return "empty error";
    }
    // run add
    _add(title, id, pass);
  }

  _add(String title, String id, String pass) {
    _titles.add(title);
    _ids.add(id);
    _passwords.add(pass);
  }

  ///
  /// 指定パスワード削除
  ///
  delete(dynamic index) {
    // list access check
    if (!_indexError(index)) {
      return "index error";
    }
    // run delete
    _delete(index);
  }

  ///
  /// リスト削除実行
  ///
  _delete(dynamic index) {
    _titles.removeAt(index);
    _ids.removeAt(index);
    _passwords.removeAt(index);
  }

  ///
  /// 指定パスワード更新
  ///
  update(dynamic index, String title, String id, String pass) {
    // if all empty error
    if (title.isEmpty && id.isEmpty && pass.isEmpty) {
      return "empty error";
    }

    // list access check
    if (!_indexError(index)) {
      return "index error";
    }

    // run update
    _update(index, title, id, pass);
  }

  ///
  /// リスト更新実行
  ///
  _update(dynamic index, String title, String id, String pass) {
    _titles[index] = title;
    _ids[index] = id;
    _passwords[index] = pass;
  }

  ///
  /// 指定パスワード情報取得
  ///
  get(dynamic index) {
    // list access check
    if (!_indexError(index)) {
      return "index error";
    }
    return _get(index);
  }

  _get(dynamic index) {
    var res = new List<String>();
    // set info
    res.add(_titles[index]);
    res.add(_ids[index]);
    res.add(_passwords[index]);
    return res;
  }

  ///
  /// リストの表示
  ///
  showLists() {
    print(_titles);
    print(_ids);
    print(_passwords);
  }

  ///
  /// 指定パスワードList情報取得
  /// t : all title info
  /// i : all id info
  /// p : all password info
  ///
  getList(dynamic type) {
    var res = new List<String>();
    // switchで返すList判断
    switch (type) {
      case 't':
        res = _titles;
        break;
      case 'i':
        res = _ids;
        break;
      case 'p':
        res = _passwords;
        break;
      default: // Error
        // TODO Error処理
        print("switch error");
    }
    return res;
  }

  ///
  /// 指定したリストのサイズ取得
  ///
  getListLength(dynamic type) {
    var _length = -1;

    switch (type) {
      case 't':
        _length = _titles.length;
        break;
      case 'i':
        _length = _ids.length;
        break;
      case 'p':
        _length = _passwords.length;
        break;
      default: // Error
        return _length;
    }
    return _length;
  }

  ///
  /// Listにアクセス可能かチェック
  ///
  _indexError(dynamic index) {
    if (index >= _titles.length ||
        index >= _ids.length ||
        index >= _passwords.length) {
      return false;
    }
    return true;
  }
}
