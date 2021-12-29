import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// SharedPreferencesシングルトンパータンのラッパークラス
class LocalStorage {
  /// プライベートでスタティックのインスタンス作成
  static final _instance = LocalStorage._init();

  /// ファクトリーコンストラクタでインスタンスを返す
  factory LocalStorage() => _instance;

  /// SharedPreferencesを遅延宣言
  static late SharedPreferences _sharedPreferences;

  /// ネーミングコンストラクタでSharedPreferencesを初期化
  LocalStorage._init() {
    _initStorage();
  }

  /// 非同期でSharedPreferencesのインスタンスを取得
  _initStorage() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  /// [key]と[value]の形で値を保存
  Future<void> setStorage(String key, dynamic value) async {
    await _initStorage();
    String type;

    // valueの型を確認し、MapとListの場合、Jsonに変換して、文字列として保存
    if (value is Map || value is List) {
      type = 'String';
      value = const JsonEncoder().convert(value);
    }
    // 以外の場合、valueの型の文字列を取得
    else {
      type = value.runtimeType.toString();
    }
    // valueの型を基に、該当するメソッドで保存
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

  /// [key]で保存した値を取得
  Future<dynamic> getStorage(String key) async {
    await _initStorage();
    dynamic value = _sharedPreferences.get(key);

    // valueを確認し、Json文字列の場合、デコーダー
    if (_isJson(value)) {
      return const JsonDecoder().convert(value);
    }
    // 以外の場合、そのまま返す
    else {
      return value;
    }
  }

  /// [key]が存在するかどうかを確認
  Future<bool> hasKey(String key) async {
    await _initStorage();
    return _sharedPreferences.containsKey(key);
  }

  /// [key]で保存した値を削除
  /// 存在した場合[key]を削除し、trueを返す、存在しない場合、falseを返す。
  Future<bool> removeStorage(String key) async {
    await _initStorage();
    if (await hasKey(key)) {
      await _sharedPreferences.remove(key);
      return true;
    } else {
      return false;
    }
  }

  /// 保存した値を全部削除
  Future<bool> clear() async {
    await _initStorage();
    return _sharedPreferences.clear();
  }

  /// 保存した全ての[key]の型を取得
  Future<Set<String>> getKeys() async {
    await _initStorage();
    return _sharedPreferences.getKeys();
  }

  /// [value]はJson文字列かどうかを確認
  /// Json文字列の場合、trueを返す、以外の場合、falseを返す
  _isJson(dynamic value) {
    try {
      const JsonDecoder().convert(value);
      return true;
    } catch (e) {
      return false;
    }
  }
}
