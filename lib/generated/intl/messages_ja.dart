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
        "comingSoon": MessageLookupByLibrary.simpleMessage("まもなく発売"),
        "confirmPassword": MessageLookupByLibrary.simpleMessage("パスワード確認"),
        "createUserFailed":
            MessageLookupByLibrary.simpleMessage("ユーザ作成に失敗しました。"),
        "dark": MessageLookupByLibrary.simpleMessage("ダーク"),
        "darkDescription": MessageLookupByLibrary.simpleMessage("黒を基調とした暗いテーマ"),
        "daysLeft": m0,
        "daysSale": m1,
        "deals": MessageLookupByLibrary.simpleMessage("セール"),
        "desc": MessageLookupByLibrary.simpleMessage("説明"),
        "developer": MessageLookupByLibrary.simpleMessage("開発元"),
        "email": MessageLookupByLibrary.simpleMessage("メールアドレス"),
        "emailAlreadyInUse":
            MessageLookupByLibrary.simpleMessage("メールアドレスは既に使われています。"),
        "forgotPassword": MessageLookupByLibrary.simpleMessage("パスワードを忘れた?"),
        "forgotPasswordMessage": MessageLookupByLibrary.simpleMessage(
            "メールアドレスを入力すると、パスワードリセットのリンクが送信されます"),
        "fps": MessageLookupByLibrary.simpleMessage("ファーストパーソン・シューティング"),
        "ftg": MessageLookupByLibrary.simpleMessage("対戦型格闘"),
        "game": MessageLookupByLibrary.simpleMessage("ゲーム"),
        "genre": MessageLookupByLibrary.simpleMessage("ジャンル"),
        "invalidEmail": MessageLookupByLibrary.simpleMessage("無効なメールアドレス"),
        "languages": MessageLookupByLibrary.simpleMessage("言語"),
        "light": MessageLookupByLibrary.simpleMessage("ライト"),
        "lightDescription":
            MessageLookupByLibrary.simpleMessage("白を基調とした明るいテーマ"),
        "name": MessageLookupByLibrary.simpleMessage("名称"),
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
        "priceUndecided": MessageLookupByLibrary.simpleMessage("価格未定"),
        "publisher": MessageLookupByLibrary.simpleMessage("発売元"),
        "pzl": MessageLookupByLibrary.simpleMessage("パズル"),
        "rcg": MessageLookupByLibrary.simpleMessage("レース"),
        "release": MessageLookupByLibrary.simpleMessage("発売予定"),
        "releaseDate": MessageLookupByLibrary.simpleMessage("発売日"),
        "releaseDateSort": MessageLookupByLibrary.simpleMessage("リリース日で並び替え"),
        "releaseUndecided": MessageLookupByLibrary.simpleMessage("発売日未定"),
        "required": m2,
        "resetPassword": MessageLookupByLibrary.simpleMessage("パスワード再設定"),
        "rpg": MessageLookupByLibrary.simpleMessage("ロールプレイング"),
        "salePriceSort": MessageLookupByLibrary.simpleMessage("セール価格で並び替え"),
        "searchFilter": MessageLookupByLibrary.simpleMessage("検索フィルター"),
        "sendingFailed": MessageLookupByLibrary.simpleMessage("メール送信に失敗しました。"),
        "sendingSuccess": MessageLookupByLibrary.simpleMessage("メール送信に成功しました。"),
        "settings": MessageLookupByLibrary.simpleMessage("設定"),
        "signIn": MessageLookupByLibrary.simpleMessage("サインイン"),
        "signInMessage": MessageLookupByLibrary.simpleMessage("サインインしてくだい"),
        "signOut": MessageLookupByLibrary.simpleMessage("サインアウト"),
        "signUp": MessageLookupByLibrary.simpleMessage("サインアップ"),
        "slg": MessageLookupByLibrary.simpleMessage("シミュレーション"),
        "spg": MessageLookupByLibrary.simpleMessage("スポーツ"),
        "stg": MessageLookupByLibrary.simpleMessage("シューティング"),
        "system": MessageLookupByLibrary.simpleMessage("システム"),
        "systemDescription":
            MessageLookupByLibrary.simpleMessage("端末のシステム設定に追従"),
        "theme": MessageLookupByLibrary.simpleMessage("テーマ"),
        "tps": MessageLookupByLibrary.simpleMessage("サードパーソン・シューティング"),
        "userNotFound": MessageLookupByLibrary.simpleMessage("ユーザが存在しません。"),
        "voice": MessageLookupByLibrary.simpleMessage("音声")
      };
}
