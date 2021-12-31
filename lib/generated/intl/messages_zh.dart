// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh locale. All the
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
  String get localeName => 'zh';

  static String m0(day) => "还剩${day}天";

  static String m1(day) => "距离发售还有${day}天";

  static String m2(name) => "${name}不能为空";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account": MessageLookupByLibrary.simpleMessage("账号"),
        "accountConfirm": MessageLookupByLibrary.simpleMessage("没有账号?"),
        "act": MessageLookupByLibrary.simpleMessage("动作"),
        "adv": MessageLookupByLibrary.simpleMessage("冒险"),
        "appName": MessageLookupByLibrary.simpleMessage("游戏折扣"),
        "authenticationFailed":
            MessageLookupByLibrary.simpleMessage("邮箱或密码错误。"),
        "basicInfo": MessageLookupByLibrary.simpleMessage("基本信息"),
        "cancel": MessageLookupByLibrary.simpleMessage("取消"),
        "comingSoon": MessageLookupByLibrary.simpleMessage("即将发售"),
        "confirmPassword": MessageLookupByLibrary.simpleMessage("确认密码"),
        "createUserFailed": MessageLookupByLibrary.simpleMessage("创建用户失败。"),
        "dark": MessageLookupByLibrary.simpleMessage("深色"),
        "darkDescription": MessageLookupByLibrary.simpleMessage("以黑色为主调的深色主题"),
        "daysLeft": m0,
        "daysSale": m1,
        "deals": MessageLookupByLibrary.simpleMessage("折扣"),
        "desc": MessageLookupByLibrary.simpleMessage("简介"),
        "developer": MessageLookupByLibrary.simpleMessage("开发商"),
        "email": MessageLookupByLibrary.simpleMessage("邮箱"),
        "emailAlreadyInUse": MessageLookupByLibrary.simpleMessage("该邮箱已经被注册。"),
        "favorite": MessageLookupByLibrary.simpleMessage("收藏"),
        "forgotPassword": MessageLookupByLibrary.simpleMessage("忘记密码?"),
        "forgotPasswordMessage":
            MessageLookupByLibrary.simpleMessage("提供您的电子邮件，我们将向您发送一个链接以重置您的密码"),
        "ftg": MessageLookupByLibrary.simpleMessage("格斗"),
        "game": MessageLookupByLibrary.simpleMessage("游戏"),
        "gameDetail": MessageLookupByLibrary.simpleMessage("游戏详情"),
        "gameInfo": MessageLookupByLibrary.simpleMessage("游戏情报"),
        "genre": MessageLookupByLibrary.simpleMessage("类型"),
        "invalidEmail": MessageLookupByLibrary.simpleMessage("无效的邮箱"),
        "languages": MessageLookupByLibrary.simpleMessage("语言"),
        "light": MessageLookupByLibrary.simpleMessage("浅色"),
        "lightDescription": MessageLookupByLibrary.simpleMessage("以白色为主调的浅色主题"),
        "lowestPrice": MessageLookupByLibrary.simpleMessage("最低价格更新通知"),
        "name": MessageLookupByLibrary.simpleMessage("名称"),
        "noResults": MessageLookupByLibrary.simpleMessage("没有检索到一致的结果。"),
        "notificationOff": MessageLookupByLibrary.simpleMessage("通知关闭"),
        "numberOfGames": MessageLookupByLibrary.simpleMessage("游戏数量"),
        "password": MessageLookupByLibrary.simpleMessage("密码"),
        "passwordDigit": MessageLookupByLibrary.simpleMessage("至少得包含1个数字"),
        "passwordLength": MessageLookupByLibrary.simpleMessage("必须有8位数以上"),
        "passwordLowercase":
            MessageLookupByLibrary.simpleMessage("至少得包含1个小写字母"),
        "passwordMismatch": MessageLookupByLibrary.simpleMessage("密码不一致"),
        "passwordPolicy": MessageLookupByLibrary.simpleMessage(
            "密码必须有8位数以上、而且至少得包含1个大写字母，小写字母，数字和特殊符号的组合。"),
        "passwordSpecialCharacter":
            MessageLookupByLibrary.simpleMessage("至少得包含1个特殊符号"),
        "passwordUppercase":
            MessageLookupByLibrary.simpleMessage("至少得包含1个大写字母"),
        "platform": MessageLookupByLibrary.simpleMessage("平台"),
        "priceFluctuation": MessageLookupByLibrary.simpleMessage("价格变动通知"),
        "priceUndecided": MessageLookupByLibrary.simpleMessage("价格未定"),
        "publisher": MessageLookupByLibrary.simpleMessage("发行商"),
        "pzl": MessageLookupByLibrary.simpleMessage("解密"),
        "rcg": MessageLookupByLibrary.simpleMessage("赛车"),
        "release": MessageLookupByLibrary.simpleMessage("发售表"),
        "releaseDate": MessageLookupByLibrary.simpleMessage("发售日"),
        "releaseDateSort": MessageLookupByLibrary.simpleMessage("按发售日排序"),
        "releaseUndecided": MessageLookupByLibrary.simpleMessage("发售日未定"),
        "remove": MessageLookupByLibrary.simpleMessage("移除"),
        "required": m2,
        "resetPassword": MessageLookupByLibrary.simpleMessage("重置密码"),
        "rpg": MessageLookupByLibrary.simpleMessage("角色扮演"),
        "salePriceSort": MessageLookupByLibrary.simpleMessage("按折扣价格排序"),
        "searchFilter": MessageLookupByLibrary.simpleMessage("查询过滤"),
        "searchMessage": MessageLookupByLibrary.simpleMessage("用游戏的全名进行检索"),
        "sendingFailed": MessageLookupByLibrary.simpleMessage("发送电子邮件失败。"),
        "sendingSuccess": MessageLookupByLibrary.simpleMessage("邮件发送成功。"),
        "settings": MessageLookupByLibrary.simpleMessage("设定"),
        "signIn": MessageLookupByLibrary.simpleMessage("登录"),
        "signInMessage": MessageLookupByLibrary.simpleMessage("请登录"),
        "signOut": MessageLookupByLibrary.simpleMessage("登出"),
        "signUp": MessageLookupByLibrary.simpleMessage("注册"),
        "slg": MessageLookupByLibrary.simpleMessage("模拟"),
        "spg": MessageLookupByLibrary.simpleMessage("运动"),
        "stg": MessageLookupByLibrary.simpleMessage("射击"),
        "system": MessageLookupByLibrary.simpleMessage("系统"),
        "systemDescription": MessageLookupByLibrary.simpleMessage("跟随系统的设定"),
        "theme": MessageLookupByLibrary.simpleMessage("主题"),
        "userNotFound": MessageLookupByLibrary.simpleMessage("用户不存在。"),
        "voice": MessageLookupByLibrary.simpleMessage("语音")
      };
}
