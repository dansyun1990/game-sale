// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(name) => "${name} is required";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accountConfirm":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account?"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm password"),
        "dark": MessageLookupByLibrary.simpleMessage("Dark"),
        "darkDescription":
            MessageLookupByLibrary.simpleMessage("Dark theme based on black"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot password?"),
        "forgotPasswordMessage": MessageLookupByLibrary.simpleMessage(
            "Provide your email and we will send you a link to reset your password"),
        "invalidEmail":
            MessageLookupByLibrary.simpleMessage("Invalid email address"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "light": MessageLookupByLibrary.simpleMessage("Light"),
        "lightDescription":
            MessageLookupByLibrary.simpleMessage("Light theme based on white"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordDigit": MessageLookupByLibrary.simpleMessage(
            "Should contain at least one digit"),
        "passwordLength": MessageLookupByLibrary.simpleMessage(
            "Must be at least 8 characters in length"),
        "passwordLowercase": MessageLookupByLibrary.simpleMessage(
            "Should contain at least one lowercase"),
        "passwordMismatch":
            MessageLookupByLibrary.simpleMessage("Password do not match"),
        "passwordPolicy": MessageLookupByLibrary.simpleMessage(
            "The password must be at least 8 characters and must contain at least one uppercase, lowercase, digit, and special character."),
        "passwordSpecialCharacter": MessageLookupByLibrary.simpleMessage(
            "Should contain at least one special character"),
        "passwordUppercase": MessageLookupByLibrary.simpleMessage(
            "Should contain at least one uppercase"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "required": m0,
        "resetPassword": MessageLookupByLibrary.simpleMessage("Reset password"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "system": MessageLookupByLibrary.simpleMessage("System"),
        "systemDescription":
            MessageLookupByLibrary.simpleMessage("Follow the system settings"),
        "theme": MessageLookupByLibrary.simpleMessage("Theme")
      };
}
