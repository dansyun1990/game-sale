// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Game sale`
  String get appName {
    return Intl.message(
      'Game sale',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Game`
  String get game {
    return Intl.message(
      'Game',
      name: 'game',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get accountConfirm {
    return Intl.message(
      'Don\'t have an account?',
      name: 'accountConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Provide your email and we will send you a link to reset your password`
  String get forgotPasswordMessage {
    return Intl.message(
      'Provide your email and we will send you a link to reset your password',
      name: 'forgotPasswordMessage',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get resetPassword {
    return Intl.message(
      'Reset password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `The password must be at least 8 characters and must contain at least one uppercase, lowercase, digit, and special character.`
  String get passwordPolicy {
    return Intl.message(
      'The password must be at least 8 characters and must contain at least one uppercase, lowercase, digit, and special character.',
      name: 'passwordPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Should contain at least one uppercase`
  String get passwordUppercase {
    return Intl.message(
      'Should contain at least one uppercase',
      name: 'passwordUppercase',
      desc: '',
      args: [],
    );
  }

  /// `Should contain at least one lowercase`
  String get passwordLowercase {
    return Intl.message(
      'Should contain at least one lowercase',
      name: 'passwordLowercase',
      desc: '',
      args: [],
    );
  }

  /// `Should contain at least one digit`
  String get passwordDigit {
    return Intl.message(
      'Should contain at least one digit',
      name: 'passwordDigit',
      desc: '',
      args: [],
    );
  }

  /// `Should contain at least one special character`
  String get passwordSpecialCharacter {
    return Intl.message(
      'Should contain at least one special character',
      name: 'passwordSpecialCharacter',
      desc: '',
      args: [],
    );
  }

  /// `Must be at least 8 characters in length`
  String get passwordLength {
    return Intl.message(
      'Must be at least 8 characters in length',
      name: 'passwordLength',
      desc: '',
      args: [],
    );
  }

  /// `{name} is required`
  String required(Object name) {
    return Intl.message(
      '$name is required',
      name: 'required',
      desc: '',
      args: [name],
    );
  }

  /// `Invalid email address`
  String get invalidEmail {
    return Intl.message(
      'Invalid email address',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password do not match`
  String get passwordMismatch {
    return Intl.message(
      'Password do not match',
      name: 'passwordMismatch',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `System`
  String get system {
    return Intl.message(
      'System',
      name: 'system',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `Follow the system settings`
  String get systemDescription {
    return Intl.message(
      'Follow the system settings',
      name: 'systemDescription',
      desc: '',
      args: [],
    );
  }

  /// `Light theme based on white`
  String get lightDescription {
    return Intl.message(
      'Light theme based on white',
      name: 'lightDescription',
      desc: '',
      args: [],
    );
  }

  /// `Dark theme based on black`
  String get darkDescription {
    return Intl.message(
      'Dark theme based on black',
      name: 'darkDescription',
      desc: '',
      args: [],
    );
  }

  /// `Search filter`
  String get searchFilter {
    return Intl.message(
      'Search filter',
      name: 'searchFilter',
      desc: '',
      args: [],
    );
  }

  /// `Platform`
  String get platform {
    return Intl.message(
      'Platform',
      name: 'platform',
      desc: '',
      args: [],
    );
  }

  /// `Action`
  String get act {
    return Intl.message(
      'Action',
      name: 'act',
      desc: '',
      args: [],
    );
  }

  /// `Adventure`
  String get adv {
    return Intl.message(
      'Adventure',
      name: 'adv',
      desc: '',
      args: [],
    );
  }

  /// `First-person shooter`
  String get fps {
    return Intl.message(
      'First-person shooter',
      name: 'fps',
      desc: '',
      args: [],
    );
  }

  /// `Fighting`
  String get ftg {
    return Intl.message(
      'Fighting',
      name: 'ftg',
      desc: '',
      args: [],
    );
  }

  /// `Puzzle`
  String get pzl {
    return Intl.message(
      'Puzzle',
      name: 'pzl',
      desc: '',
      args: [],
    );
  }

  /// `Racing`
  String get rcg {
    return Intl.message(
      'Racing',
      name: 'rcg',
      desc: '',
      args: [],
    );
  }

  /// `Role-playing`
  String get rpg {
    return Intl.message(
      'Role-playing',
      name: 'rpg',
      desc: '',
      args: [],
    );
  }

  /// `Simulation`
  String get slg {
    return Intl.message(
      'Simulation',
      name: 'slg',
      desc: '',
      args: [],
    );
  }

  /// `Sports`
  String get spg {
    return Intl.message(
      'Sports',
      name: 'spg',
      desc: '',
      args: [],
    );
  }

  /// `Shooter`
  String get stg {
    return Intl.message(
      'Shooter',
      name: 'stg',
      desc: '',
      args: [],
    );
  }

  /// `Third-person shooter`
  String get tps {
    return Intl.message(
      'Third-person shooter',
      name: 'tps',
      desc: '',
      args: [],
    );
  }

  /// `Genre`
  String get genre {
    return Intl.message(
      'Genre',
      name: 'genre',
      desc: '',
      args: [],
    );
  }

  /// `Price undecided`
  String get priceUndecided {
    return Intl.message(
      'Price undecided',
      name: 'priceUndecided',
      desc: '',
      args: [],
    );
  }

  /// `Release undecided`
  String get releaseUndecided {
    return Intl.message(
      'Release undecided',
      name: 'releaseUndecided',
      desc: '',
      args: [],
    );
  }

  /// `Coming soon`
  String get comingSoon {
    return Intl.message(
      'Coming soon',
      name: 'comingSoon',
      desc: '',
      args: [],
    );
  }

  /// `{day} days going on sale`
  String daysSale(Object day) {
    return Intl.message(
      '$day days going on sale',
      name: 'daysSale',
      desc: '',
      args: [day],
    );
  }

  /// `{day} days left`
  String daysLeft(Object day) {
    return Intl.message(
      '$day days left',
      name: 'daysLeft',
      desc: '',
      args: [day],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
