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

  /// `en`
  String get locale {
    return Intl.message(
      'en',
      name: 'locale',
      desc: '',
      args: [],
    );
  }

  /// `Kabaten`
  String get appName {
    return Intl.message(
      'Kabaten',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get answerOk {
    return Intl.message(
      'OK',
      name: 'answerOk',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get answerYes {
    return Intl.message(
      'Yes',
      name: 'answerYes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get answerNo {
    return Intl.message(
      'No',
      name: 'answerNo',
      desc: '',
      args: [],
    );
  }

  /// `ALL`
  String get all {
    return Intl.message(
      'ALL',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `No items to show`
  String get noItems {
    return Intl.message(
      'No items to show',
      name: 'noItems',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong, please try again later.`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong, please try again later.',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get fieldRequired {
    return Intl.message(
      'This field is required',
      name: 'fieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `Invalid input`
  String get errorInvalidInput {
    return Intl.message(
      'Invalid input',
      name: 'errorInvalidInput',
      desc: '',
      args: [],
    );
  }

  /// `Input should be greater than zero`
  String get errorGreaterThanZero {
    return Intl.message(
      'Input should be greater than zero',
      name: 'errorGreaterThanZero',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get emailRequired {
    return Intl.message(
      'Email is required',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Email is not in correct format`
  String get emailValidation {
    return Intl.message(
      'Email is not in correct format',
      name: 'emailValidation',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get passwordRequired {
    return Intl.message(
      'Password is required',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain 8 characters, 1 uppercase, 1 lowercase, 1 number, 1 special sign: !.#@`
  String get passwordValidation {
    return Intl.message(
      'Password must contain 8 characters, 1 uppercase, 1 lowercase, 1 number, 1 special sign: !.#@',
      name: 'passwordValidation',
      desc: '',
      args: [],
    );
  }

  /// `Password and confirm password does not match`
  String get errorNotMatchPassword {
    return Intl.message(
      'Password and confirm password does not match',
      name: 'errorNotMatchPassword',
      desc: '',
      args: [],
    );
  }

  /// `Oops! something went wrong, please try again later`
  String get errorSystem {
    return Intl.message(
      'Oops! something went wrong, please try again later',
      name: 'errorSystem',
      desc: '',
      args: [],
    );
  }

  /// `Operation not allowed`
  String get errorOperationNotAllowed {
    return Intl.message(
      'Operation not allowed',
      name: 'errorOperationNotAllowed',
      desc: '',
      args: [],
    );
  }

  /// `Too many requests, please try again later`
  String get errorTooManyRequests {
    return Intl.message(
      'Too many requests, please try again later',
      name: 'errorTooManyRequests',
      desc: '',
      args: [],
    );
  }

  /// `The provided email is invalid`
  String get errorInvalidEmail {
    return Intl.message(
      'The provided email is invalid',
      name: 'errorInvalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Your account is disabled, please contact the support team`
  String get errorUserDisabled {
    return Intl.message(
      'Your account is disabled, please contact the support team',
      name: 'errorUserDisabled',
      desc: '',
      args: [],
    );
  }

  /// `No user found for that email`
  String get errorUserNotFound {
    return Intl.message(
      'No user found for that email',
      name: 'errorUserNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password provided for that user`
  String get errorWrongPassword {
    return Intl.message(
      'Wrong password provided for that user',
      name: 'errorWrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `The account already exists for that email`
  String get errorEmailAlreadyInUse {
    return Intl.message(
      'The account already exists for that email',
      name: 'errorEmailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `The password provided is too weak`
  String get errorWeakPassword {
    return Intl.message(
      'The password provided is too weak',
      name: 'errorWeakPassword',
      desc: '',
      args: [],
    );
  }

  /// `Invalid credential`
  String get errorInvalidCredential {
    return Intl.message(
      'Invalid credential',
      name: 'errorInvalidCredential',
      desc: '',
      args: [],
    );
  }

  /// `Invalid verification code`
  String get errorInvalidVerificationCode {
    return Intl.message(
      'Invalid verification code',
      name: 'errorInvalidVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Invalid verification ID`
  String get errorInvalidVerificationId {
    return Intl.message(
      'Invalid verification ID',
      name: 'errorInvalidVerificationId',
      desc: '',
      args: [],
    );
  }

  /// `Please logout and login again, then try again`
  String get errorRequiresRecentLogin {
    return Intl.message(
      'Please logout and login again, then try again',
      name: 'errorRequiresRecentLogin',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get fullName {
    return Intl.message(
      'Full name',
      name: 'fullName',
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

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password confirmation`
  String get passwordConfirmation {
    return Intl.message(
      'Password confirmation',
      name: 'passwordConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Show password`
  String get showPassword {
    return Intl.message(
      'Show password',
      name: 'showPassword',
      desc: '',
      args: [],
    );
  }

  /// `Hide password`
  String get hidePassword {
    return Intl.message(
      'Hide password',
      name: 'hidePassword',
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

  /// `Or With`
  String get orWith {
    return Intl.message(
      'Or With',
      name: 'orWith',
      desc: '',
      args: [],
    );
  }

  /// `Apple`
  String get apple {
    return Intl.message(
      'Apple',
      name: 'apple',
      desc: '',
      args: [],
    );
  }

  /// `Google`
  String get google {
    return Intl.message(
      'Google',
      name: 'google',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get facebook {
    return Intl.message(
      'Facebook',
      name: 'facebook',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Logged Out`
  String get loggedOut {
    return Intl.message(
      'Logged Out',
      name: 'loggedOut',
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

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password?`
  String get forgotYourPassword {
    return Intl.message(
      'Forgot your password?',
      name: 'forgotYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account yet?`
  String get doNotHaveAccount {
    return Intl.message(
      'Don’t have an account yet?',
      name: 'doNotHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create an account`
  String get createAccount {
    return Intl.message(
      'Create an account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get user {
    return Intl.message(
      'User',
      name: 'user',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
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
