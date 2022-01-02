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

  static String m0(day) => "${day} days left";

  static String m1(day) => "${day} days going on sale";

  static String m2(name) => "${name} is required";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account": MessageLookupByLibrary.simpleMessage("Account"),
        "accountConfirm":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account?"),
        "act": MessageLookupByLibrary.simpleMessage("Action"),
        "adv": MessageLookupByLibrary.simpleMessage("Adventure"),
        "appName": MessageLookupByLibrary.simpleMessage("Game sale"),
        "authenticationFailed": MessageLookupByLibrary.simpleMessage(
            "The password is incorrect or the email cannot be recognized."),
        "basicInfo": MessageLookupByLibrary.simpleMessage("Basic info"),
        "beginner": MessageLookupByLibrary.simpleMessage("Beginner"),
        "bestPrice": MessageLookupByLibrary.simpleMessage("Best price"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "clear": MessageLookupByLibrary.simpleMessage("Clear"),
        "clearTime": MessageLookupByLibrary.simpleMessage("Clear time"),
        "comingSoon": MessageLookupByLibrary.simpleMessage("Coming soon"),
        "complete": MessageLookupByLibrary.simpleMessage("Complete"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm password"),
        "createUserFailed":
            MessageLookupByLibrary.simpleMessage("Failed to create a user."),
        "currentPrice": MessageLookupByLibrary.simpleMessage("Current price"),
        "dark": MessageLookupByLibrary.simpleMessage("Dark"),
        "darkDescription":
            MessageLookupByLibrary.simpleMessage("Dark theme based on black"),
        "daysLeft": m0,
        "daysSale": m1,
        "deals": MessageLookupByLibrary.simpleMessage("Deals"),
        "desc": MessageLookupByLibrary.simpleMessage("Description"),
        "developer": MessageLookupByLibrary.simpleMessage("Developer"),
        "difficulty": MessageLookupByLibrary.simpleMessage("Difficulty"),
        "digitalEditionPrice":
            MessageLookupByLibrary.simpleMessage("Digital edition price"),
        "easy": MessageLookupByLibrary.simpleMessage("Easy"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emailAlreadyInUse": MessageLookupByLibrary.simpleMessage(
            "The account already exists for that email."),
        "favorite": MessageLookupByLibrary.simpleMessage("Favorite"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot password?"),
        "forgotPasswordMessage": MessageLookupByLibrary.simpleMessage(
            "Provide your email and we will send you a link to reset your password"),
        "ftg": MessageLookupByLibrary.simpleMessage("Fighting"),
        "game": MessageLookupByLibrary.simpleMessage("Game"),
        "gameDetail": MessageLookupByLibrary.simpleMessage("Game detail"),
        "gameDifficulty":
            MessageLookupByLibrary.simpleMessage("Game difficulty"),
        "gameInfo": MessageLookupByLibrary.simpleMessage("Game info"),
        "gameProgress": MessageLookupByLibrary.simpleMessage("Game progress"),
        "gameReview": MessageLookupByLibrary.simpleMessage("Game review"),
        "genre": MessageLookupByLibrary.simpleMessage("Genre"),
        "hard": MessageLookupByLibrary.simpleMessage("Hard"),
        "hours": MessageLookupByLibrary.simpleMessage("hours"),
        "invalidEmail":
            MessageLookupByLibrary.simpleMessage("Invalid email address"),
        "languages": MessageLookupByLibrary.simpleMessage("Languages"),
        "light": MessageLookupByLibrary.simpleMessage("Light"),
        "lightDescription":
            MessageLookupByLibrary.simpleMessage("Light theme based on white"),
        "lowestPrice":
            MessageLookupByLibrary.simpleMessage("Notify lowest price"),
        "maniac": MessageLookupByLibrary.simpleMessage("Maniac"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "newReviews": MessageLookupByLibrary.simpleMessage("New reviews"),
        "noResults":
            MessageLookupByLibrary.simpleMessage("No matching results found."),
        "normal": MessageLookupByLibrary.simpleMessage("Normal"),
        "notificationOff":
            MessageLookupByLibrary.simpleMessage("Notification off"),
        "numberOfGames":
            MessageLookupByLibrary.simpleMessage("Number of games"),
        "ongoing": MessageLookupByLibrary.simpleMessage("Ongoing"),
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
        "platform": MessageLookupByLibrary.simpleMessage("Platform"),
        "price": MessageLookupByLibrary.simpleMessage("Price"),
        "priceFluctuation":
            MessageLookupByLibrary.simpleMessage("Notify price fluctuations"),
        "priceUndecided":
            MessageLookupByLibrary.simpleMessage("Price undecided"),
        "progress": MessageLookupByLibrary.simpleMessage("Progress"),
        "publisher": MessageLookupByLibrary.simpleMessage("Publisher"),
        "pzl": MessageLookupByLibrary.simpleMessage("Puzzle"),
        "rcg": MessageLookupByLibrary.simpleMessage("Racing"),
        "release": MessageLookupByLibrary.simpleMessage("Coming soon"),
        "releaseDate": MessageLookupByLibrary.simpleMessage("Release"),
        "releaseDateSort":
            MessageLookupByLibrary.simpleMessage("Sort by release date"),
        "releaseUndecided":
            MessageLookupByLibrary.simpleMessage("Release undecided"),
        "remove": MessageLookupByLibrary.simpleMessage("Remove"),
        "required": m2,
        "resetPassword": MessageLookupByLibrary.simpleMessage("Reset password"),
        "reviewHelper":
            MessageLookupByLibrary.simpleMessage("10 characters or more"),
        "reviewLength": MessageLookupByLibrary.simpleMessage(
            "Please enter at least 10 characters"),
        "reviewMessage":
            MessageLookupByLibrary.simpleMessage("Please write a review"),
        "rpg": MessageLookupByLibrary.simpleMessage("Role-playing"),
        "salePriceSort":
            MessageLookupByLibrary.simpleMessage("Sort by sale price"),
        "searchFilter": MessageLookupByLibrary.simpleMessage("Search filter"),
        "searchMessage": MessageLookupByLibrary.simpleMessage(
            "Search by full name of the game"),
        "seeAllReviews":
            MessageLookupByLibrary.simpleMessage("See all reviews"),
        "sendingFailed":
            MessageLookupByLibrary.simpleMessage("Failed to send email."),
        "sendingSuccess": MessageLookupByLibrary.simpleMessage(
            "The email was sent successfully."),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "signIn": MessageLookupByLibrary.simpleMessage("Sign in"),
        "signInMessage": MessageLookupByLibrary.simpleMessage("Please sign in"),
        "signOut": MessageLookupByLibrary.simpleMessage("Sign out"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign up"),
        "slg": MessageLookupByLibrary.simpleMessage("Simulation"),
        "spg": MessageLookupByLibrary.simpleMessage("Sports"),
        "stg": MessageLookupByLibrary.simpleMessage("Shooter"),
        "system": MessageLookupByLibrary.simpleMessage("System"),
        "systemDescription":
            MessageLookupByLibrary.simpleMessage("Follow the system settings"),
        "theme": MessageLookupByLibrary.simpleMessage("Theme"),
        "trial": MessageLookupByLibrary.simpleMessage("Trial"),
        "userNotFound": MessageLookupByLibrary.simpleMessage("User not found."),
        "voice": MessageLookupByLibrary.simpleMessage("Voice")
      };
}
