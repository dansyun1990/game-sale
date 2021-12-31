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

  /// `Sign in`
  String get signIn {
    return Intl.message(
      'Sign in',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Please sign in`
  String get signInMessage {
    return Intl.message(
      'Please sign in',
      name: 'signInMessage',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get signOut {
    return Intl.message(
      'Sign out',
      name: 'signOut',
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

  /// `Sign up`
  String get signUp {
    return Intl.message(
      'Sign up',
      name: 'signUp',
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

  /// `The account already exists for that email.`
  String get emailAlreadyInUse {
    return Intl.message(
      'The account already exists for that email.',
      name: 'emailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `The password is incorrect or the email cannot be recognized.`
  String get authenticationFailed {
    return Intl.message(
      'The password is incorrect or the email cannot be recognized.',
      name: 'authenticationFailed',
      desc: '',
      args: [],
    );
  }

  /// `Failed to create a user.`
  String get createUserFailed {
    return Intl.message(
      'Failed to create a user.',
      name: 'createUserFailed',
      desc: '',
      args: [],
    );
  }

  /// `The email was sent successfully.`
  String get sendingSuccess {
    return Intl.message(
      'The email was sent successfully.',
      name: 'sendingSuccess',
      desc: '',
      args: [],
    );
  }

  /// `User not found.`
  String get userNotFound {
    return Intl.message(
      'User not found.',
      name: 'userNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Failed to send email.`
  String get sendingFailed {
    return Intl.message(
      'Failed to send email.',
      name: 'sendingFailed',
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

  /// `Favorite`
  String get favorite {
    return Intl.message(
      'Favorite',
      name: 'favorite',
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

  /// `Deals`
  String get deals {
    return Intl.message(
      'Deals',
      name: 'deals',
      desc: '',
      args: [],
    );
  }

  /// `Coming soon`
  String get release {
    return Intl.message(
      'Coming soon',
      name: 'release',
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

  /// `Sort by release date`
  String get releaseDateSort {
    return Intl.message(
      'Sort by release date',
      name: 'releaseDateSort',
      desc: '',
      args: [],
    );
  }

  /// `Sort by sale price`
  String get salePriceSort {
    return Intl.message(
      'Sort by sale price',
      name: 'salePriceSort',
      desc: '',
      args: [],
    );
  }

  /// `Basic info`
  String get basicInfo {
    return Intl.message(
      'Basic info',
      name: 'basicInfo',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Developer`
  String get developer {
    return Intl.message(
      'Developer',
      name: 'developer',
      desc: '',
      args: [],
    );
  }

  /// `Publisher`
  String get publisher {
    return Intl.message(
      'Publisher',
      name: 'publisher',
      desc: '',
      args: [],
    );
  }

  /// `Release`
  String get releaseDate {
    return Intl.message(
      'Release',
      name: 'releaseDate',
      desc: '',
      args: [],
    );
  }

  /// `Voice`
  String get voice {
    return Intl.message(
      'Voice',
      name: 'voice',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get languages {
    return Intl.message(
      'Languages',
      name: 'languages',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get desc {
    return Intl.message(
      'Description',
      name: 'desc',
      desc: '',
      args: [],
    );
  }

  /// `Game detail`
  String get gameDetail {
    return Intl.message(
      'Game detail',
      name: 'gameDetail',
      desc: '',
      args: [],
    );
  }

  /// `Game info`
  String get gameInfo {
    return Intl.message(
      'Game info',
      name: 'gameInfo',
      desc: '',
      args: [],
    );
  }

  /// `No matching results found.`
  String get noResults {
    return Intl.message(
      'No matching results found.',
      name: 'noResults',
      desc: '',
      args: [],
    );
  }

  /// `Search by full name of the game`
  String get searchMessage {
    return Intl.message(
      'Search by full name of the game',
      name: 'searchMessage',
      desc: '',
      args: [],
    );
  }

  /// `Notification off`
  String get notificationOff {
    return Intl.message(
      'Notification off',
      name: 'notificationOff',
      desc: '',
      args: [],
    );
  }

  /// `Notify price fluctuations`
  String get priceFluctuation {
    return Intl.message(
      'Notify price fluctuations',
      name: 'priceFluctuation',
      desc: '',
      args: [],
    );
  }

  /// `Notify lowest price`
  String get lowestPrice {
    return Intl.message(
      'Notify lowest price',
      name: 'lowestPrice',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get remove {
    return Intl.message(
      'Remove',
      name: 'remove',
      desc: '',
      args: [],
    );
  }

  /// `Number of games`
  String get numberOfGames {
    return Intl.message(
      'Number of games',
      name: 'numberOfGames',
      desc: '',
      args: [],
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
