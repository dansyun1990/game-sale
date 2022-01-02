// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ja locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ja';

  static String m0(day) => "残り${day}日";

  static String m1(day) => "発売まであと${day}日";

  static String m2(name) => "${name}は必須です";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account": MessageLookupByLibrary.simpleMessage("アカウント"),
        "accountConfirm": MessageLookupByLibrary.simpleMessage("アカウントがありません?"),
        "act": MessageLookupByLibrary.simpleMessage("アクション"),
        "adv": MessageLookupByLibrary.simpleMessage("アドベンチャー"),
        "appName": MessageLookupByLibrary.simpleMessage("ゲームセール"),
        "authenticationFailed": MessageLookupByLibrary.simpleMessage(
            "入力したメールアドレスまたはパスワードに誤りがあります。"),
        "basicInfo": MessageLookupByLibrary.simpleMessage("基本情報"),
        "beginner": MessageLookupByLibrary.simpleMessage("初心者"),
        "bestPrice": MessageLookupByLibrary.simpleMessage("最安値"),
        "cancel": MessageLookupByLibrary.simpleMessage("キャンセル"),
        "clear": MessageLookupByLibrary.simpleMessage("クリア"),
        "clearTime": MessageLookupByLibrary.simpleMessage("クリア時間"),
        "comingSoon": MessageLookupByLibrary.simpleMessage("まもなく発売"),
        "complete": MessageLookupByLibrary.simpleMessage("コンプリート"),
        "confirmPassword": MessageLookupByLibrary.simpleMessage("パスワード確認"),
        "createUserFailed":
            MessageLookupByLibrary.simpleMessage("ユーザ作成に失敗しました。"),
        "currentPrice": MessageLookupByLibrary.simpleMessage("現在の価格"),
        "dark": MessageLookupByLibrary.simpleMessage("ダーク"),
        "darkDescription": MessageLookupByLibrary.simpleMessage("黒を基調とした暗いテーマ"),
        "daysLeft": m0,
        "daysSale": m1,
        "deals": MessageLookupByLibrary.simpleMessage("セール"),
        "desc": MessageLookupByLibrary.simpleMessage("説明"),
        "developer": MessageLookupByLibrary.simpleMessage("開発元"),
        "difficulty": MessageLookupByLibrary.simpleMessage("難易度"),
        "digitalEditionPrice":
            MessageLookupByLibrary.simpleMessage("デジタルエディション価格"),
        "easy": MessageLookupByLibrary.simpleMessage("簡単"),
        "email": MessageLookupByLibrary.simpleMessage("メールアドレス"),
        "emailAlreadyInUse":
            MessageLookupByLibrary.simpleMessage("メールアドレスは既に使われています。"),
        "favorite": MessageLookupByLibrary.simpleMessage("お気に入り"),
        "forgotPassword": MessageLookupByLibrary.simpleMessage("パスワードを忘れた?"),
        "forgotPasswordMessage": MessageLookupByLibrary.simpleMessage(
            "メールアドレスを入力すると、パスワードリセットのリンクが送信されます"),
        "ftg": MessageLookupByLibrary.simpleMessage("対戦型格闘"),
        "game": MessageLookupByLibrary.simpleMessage("ゲーム"),
        "gameDetail": MessageLookupByLibrary.simpleMessage("ゲーム詳細"),
        "gameDifficulty": MessageLookupByLibrary.simpleMessage("ゲーム難易度"),
        "gameInfo": MessageLookupByLibrary.simpleMessage("ゲーム情報"),
        "gameProgress": MessageLookupByLibrary.simpleMessage("ゲーム進捗"),
        "gameReview": MessageLookupByLibrary.simpleMessage("ゲームレビュー"),
        "genre": MessageLookupByLibrary.simpleMessage("ジャンル"),
        "hard": MessageLookupByLibrary.simpleMessage("困難"),
        "hours": MessageLookupByLibrary.simpleMessage("時間"),
        "invalidEmail": MessageLookupByLibrary.simpleMessage("無効なメールアドレス"),
        "languages": MessageLookupByLibrary.simpleMessage("言語"),
        "light": MessageLookupByLibrary.simpleMessage("ライト"),
        "lightDescription":
            MessageLookupByLibrary.simpleMessage("白を基調とした明るいテーマ"),
        "lowestPrice": MessageLookupByLibrary.simpleMessage("最低価格更新通知"),
        "maniac": MessageLookupByLibrary.simpleMessage("地獄"),
        "name": MessageLookupByLibrary.simpleMessage("名称"),
        "newReviews": MessageLookupByLibrary.simpleMessage("最新レビュー"),
        "noResults": MessageLookupByLibrary.simpleMessage("一致する結果が見つかりません。"),
        "normal": MessageLookupByLibrary.simpleMessage("普通"),
        "notificationOff": MessageLookupByLibrary.simpleMessage("通知オフ"),
        "numberOfGames": MessageLookupByLibrary.simpleMessage("ゲーム数"),
        "ongoing": MessageLookupByLibrary.simpleMessage("進行中"),
        "password": MessageLookupByLibrary.simpleMessage("パスワード"),
        "passwordDigit":
            MessageLookupByLibrary.simpleMessage("1つの数字を含む必要があります"),
        "passwordLength":
            MessageLookupByLibrary.simpleMessage("長さは8文字以上である必要があります"),
        "passwordLowercase":
            MessageLookupByLibrary.simpleMessage("1つの英小文字を含む必要があります"),
        "passwordMismatch": MessageLookupByLibrary.simpleMessage("パスワード不一致"),
        "passwordPolicy": MessageLookupByLibrary.simpleMessage(
            "パスワードの長さは、半角8文字以上、且つ英大文字・英小文字・数字・記号それぞれを最低1文字ずつ含む必要があります。"),
        "passwordSpecialCharacter":
            MessageLookupByLibrary.simpleMessage("1つの記号を含む必要があります"),
        "passwordUppercase":
            MessageLookupByLibrary.simpleMessage("1つの英大文字を含む必要があります"),
        "platform": MessageLookupByLibrary.simpleMessage("プラットフォーム"),
        "price": MessageLookupByLibrary.simpleMessage("価格"),
        "priceFluctuation": MessageLookupByLibrary.simpleMessage("価格変動通知"),
        "priceUndecided": MessageLookupByLibrary.simpleMessage("価格未定"),
        "progress": MessageLookupByLibrary.simpleMessage("進捗"),
        "publisher": MessageLookupByLibrary.simpleMessage("発売元"),
        "pzl": MessageLookupByLibrary.simpleMessage("パズル"),
        "rcg": MessageLookupByLibrary.simpleMessage("レース"),
        "release": MessageLookupByLibrary.simpleMessage("発売予定"),
        "releaseDate": MessageLookupByLibrary.simpleMessage("発売日"),
        "releaseDateSort": MessageLookupByLibrary.simpleMessage("リリース日で並び替え"),
        "releaseUndecided": MessageLookupByLibrary.simpleMessage("発売日未定"),
        "remove": MessageLookupByLibrary.simpleMessage("削除"),
        "required": m2,
        "resetPassword": MessageLookupByLibrary.simpleMessage("パスワード再設定"),
        "reviewHelper": MessageLookupByLibrary.simpleMessage("10文字以上"),
        "reviewLength":
            MessageLookupByLibrary.simpleMessage("10文字以上を記入してください。"),
        "reviewMessage": MessageLookupByLibrary.simpleMessage("レビューを記入してください"),
        "rpg": MessageLookupByLibrary.simpleMessage("ロールプレイング"),
        "salePriceSort": MessageLookupByLibrary.simpleMessage("セール価格で並び替え"),
        "searchFilter": MessageLookupByLibrary.simpleMessage("検索フィルター"),
        "searchMessage":
            MessageLookupByLibrary.simpleMessage("ゲームのフルネームで検索します"),
        "seeAllReviews": MessageLookupByLibrary.simpleMessage("レビューを全部見る"),
        "sendingFailed": MessageLookupByLibrary.simpleMessage("メール送信に失敗しました。"),
        "sendingSuccess": MessageLookupByLibrary.simpleMessage("メール送信に成功しました。"),
        "settings": MessageLookupByLibrary.simpleMessage("設定"),
        "signIn": MessageLookupByLibrary.simpleMessage("サインイン"),
        "signInMessage": MessageLookupByLibrary.simpleMessage("サインインしてください"),
        "signOut": MessageLookupByLibrary.simpleMessage("サインアウト"),
        "signUp": MessageLookupByLibrary.simpleMessage("サインアップ"),
        "slg": MessageLookupByLibrary.simpleMessage("シミュレーション"),
        "spg": MessageLookupByLibrary.simpleMessage("スポーツ"),
        "stg": MessageLookupByLibrary.simpleMessage("シューティング"),
        "system": MessageLookupByLibrary.simpleMessage("システム"),
        "systemDescription":
            MessageLookupByLibrary.simpleMessage("端末のシステム設定に追従"),
        "theme": MessageLookupByLibrary.simpleMessage("テーマ"),
        "trial": MessageLookupByLibrary.simpleMessage("体験"),
        "userNotFound": MessageLookupByLibrary.simpleMessage("ユーザが存在しません。"),
        "voice": MessageLookupByLibrary.simpleMessage("音声")
      };
}
