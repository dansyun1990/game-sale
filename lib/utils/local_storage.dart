import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// SharedPreferencesシングルトンパータンのラッパークラスです。
class LocalStorage {
  /// プライベートでスタティックのインスタンス作成します。
  static final _instance = LocalStorage._init();

  /// ファクトリーコンストラクタでインスタンスを返します。
  factory LocalStorage() => _instance;

  /// SharedPreferencesを遅延宣言します。
  static late SharedPreferences _sharedPreferences;

  /// ネーミングコンストラクタでSharedPreferencesを初期化します。
  LocalStorage._init() {
    _initStorage();
  }

  /// 非同期でSharedPreferencesのインスタンスを取得します。
  _initStorage() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  /// [key]と[value]の形で値を保存します。
  Future<void> setStorage(String key, dynamic value) async {
    await _initStorage();
    String type;

    // valueの型を確認し、MapとListの場合、Jsonに変換して、文字列として保存します。
    if (value is Map || value is List) {
      type = 'String';
      value = const JsonEncoder().convert(value);
    }
    // 以外の場合、valueの型の文字列を取得します。
    else {
      type = value.runtimeType.toString();
    }
    // valueの型を基に、該当するメソッドで保存します。
    switch (type) {
      case 'String':
        _sharedPreferences.setString(key, value);
        break;
      case 'int':
        _sharedPreferences.setInt(key, value);
        break;
      case 'double':
        _sharedPreferences.setDouble(key, value);
        break;
      case 'bool':
        _sharedPreferences.setDouble(key, value);
        break;
    }
  }

  /// [key]で保存した値を取得します。
  Future<dynamic> getStorage(String key) async {
    await _initStorage();
    dynamic value = _sharedPreferences.get(key);

    // valueを確認し、Json文字列の場合、デコーダーします。
    if (_isJson(value)) {
      return const JsonDecoder().convert(value);
    }
    // 以外の場合、そのまま返します。
    else {
      return value;
    }
  }

  /// [key]が存在するかどうかを確認します。
  Future<bool> hasKey(String key) async {
    await _initStorage();
    return _sharedPreferences.containsKey(key);
  }

  /// [key]で保存した値を削除します。
  /// 存在した場合[key]を削除し、trueを返す、存在しない場合、falseを返します。
  Future<bool> removeStorage(String key) async {
    await _initStorage();
    if (await hasKey(key)) {
      await _sharedPreferences.remove(key);
      return true;
    } else {
      return false;
    }
  }

  /// 保存した値を全部削除します。
  Future<bool> clear() async {
    await _initStorage();
    return _sharedPreferences.clear();
  }

  /// 保存した全ての[key]の型を取得します。
  Future<Set<String>> getKeys() async {
    await _initStorage();
    return _sharedPreferences.getKeys();
  }

  /// [value]はJson文字列かどうかを確認します。
  /// Json文字列の場合、trueを返す、以外の場合、falseを返します。
  _isJson(dynamic value) {
    try {
      const JsonDecoder().convert(value);
      return true;
    } catch (e) {
      return false;
    }
  }
}
