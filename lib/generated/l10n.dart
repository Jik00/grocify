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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Fresh groceries to your doorsteps!`
  String get onboarding1Title {
    return Intl.message(
      'Fresh groceries to your doorsteps!',
      name: 'onboarding1Title',
      desc: '',
      args: [],
    );
  }

  /// `Our grocery app is your ultimate shopping companion, designed to simplify and enhance your grocery shopping experience.`
  String get onboarding1Subtitle {
    return Intl.message(
      'Our grocery app is your ultimate shopping companion, designed to simplify and enhance your grocery shopping experience.',
      name: 'onboarding1Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Fast Shipment to your home!`
  String get onboarding2Title {
    return Intl.message(
      'Fast Shipment to your home!',
      name: 'onboarding2Title',
      desc: '',
      args: [],
    );
  }

  /// `Find your favorite items with detailed descriptions,nutritional information, and customer reviews.`
  String get onboarding2Subtitle {
    return Intl.message(
      'Find your favorite items with detailed descriptions,nutritional information, and customer reviews.',
      name: 'onboarding2Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get loginTitle {
    return Intl.message('Log In', name: 'loginTitle', desc: '', args: []);
  }

  /// `E-mail`
  String get email {
    return Intl.message('E-mail', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginButton {
    return Intl.message('Login', name: 'loginButton', desc: '', args: []);
  }

  /// `Don't have an account? `
  String get noAccount {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'noAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `or`
  String get or {
    return Intl.message('or', name: 'or', desc: '', args: []);
  }

  /// `Login with Google`
  String get loginWithGoogle {
    return Intl.message(
      'Login with Google',
      name: 'loginWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Login with Facebook`
  String get loginWithFacebook {
    return Intl.message(
      'Login with Facebook',
      name: 'loginWithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Login with Apple`
  String get loginWithApple {
    return Intl.message(
      'Login with Apple',
      name: 'loginWithApple',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `Already have an account? `
  String get haveAccount {
    return Intl.message(
      'Already have an account? ',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }

  /// ` By creating an account, you agree to our `
  String get makingAnAccount {
    return Intl.message(
      ' By creating an account, you agree to our ',
      name: 'makingAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get termsAndConditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get requiredField {
    return Intl.message(
      'This field is required',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `You must accept the terms and conditions to create an account`
  String get acceptTerms {
    return Intl.message(
      'You must accept the terms and conditions to create an account',
      name: 'acceptTerms',
      desc: '',
      args: [],
    );
  }

  /// `The password provided is too weak.`
  String get weakPassword {
    return Intl.message(
      'The password provided is too weak.',
      name: 'weakPassword',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection.`
  String get networkRequestFailed {
    return Intl.message(
      'No internet connection.',
      name: 'networkRequestFailed',
      desc: '',
      args: [],
    );
  }

  /// `An account already exists with this email.`
  String get emailAlreadyInUse {
    return Intl.message(
      'An account already exists with this email.',
      name: 'emailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `The email address is not valid.`
  String get invalidEmail {
    return Intl.message(
      'The email address is not valid.',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect email or password.`
  String get invalidCredential {
    return Intl.message(
      'Incorrect email or password.',
      name: 'invalidCredential',
      desc: '',
      args: [],
    );
  }

  /// `No account found with this email.`
  String get userNotFound {
    return Intl.message(
      'No account found with this email.',
      name: 'userNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect email or password.`
  String get wrongPassword {
    return Intl.message(
      'Incorrect email or password.',
      name: 'wrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `Failed to Login.`
  String get defaultAuthError {
    return Intl.message(
      'Failed to Login.',
      name: 'defaultAuthError',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Favorites`
  String get fav {
    return Intl.message('Favorites', name: 'fav', desc: '', args: []);
  }

  /// `Cart`
  String get cart {
    return Intl.message('Cart', name: 'cart', desc: '', args: []);
  }

  /// `Products`
  String get products {
    return Intl.message('Products', name: 'products', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Theme`
  String get theme {
    return Intl.message('Theme', name: 'theme', desc: '', args: []);
  }

  /// `Dark`
  String get dark {
    return Intl.message('Dark', name: 'dark', desc: '', args: []);
  }

  /// `Light`
  String get light {
    return Intl.message('Light', name: 'light', desc: '', args: []);
  }

  /// `System`
  String get system {
    return Intl.message('System', name: 'system', desc: '', args: []);
  }

  /// `Welcome !`
  String get welcome {
    return Intl.message('Welcome !', name: 'welcome', desc: '', args: []);
  }

  /// `Search ...`
  String get search {
    return Intl.message('Search ...', name: 'search', desc: '', args: []);
  }

  /// `New Member`
  String get newMember {
    return Intl.message('New Member', name: 'newMember', desc: '', args: []);
  }

  /// `Discount`
  String get discount {
    return Intl.message('Discount', name: 'discount', desc: '', args: []);
  }

  /// `40%`
  String get off {
    return Intl.message('40%', name: 'off', desc: '', args: []);
  }

  /// `Get Now`
  String get getNow {
    return Intl.message('Get Now', name: 'getNow', desc: '', args: []);
  }

  /// `Categories`
  String get categories {
    return Intl.message('Categories', name: 'categories', desc: '', args: []);
  }

  /// `View All`
  String get viewAll {
    return Intl.message('View All', name: 'viewAll', desc: '', args: []);
  }

  /// `Fruits & Vegetables`
  String get fruitsVegetables {
    return Intl.message(
      'Fruits & Vegetables',
      name: 'fruitsVegetables',
      desc: '',
      args: [],
    );
  }

  /// `Egg, Cheese & Cold Cuts`
  String get eggCheeseColdcuts {
    return Intl.message(
      'Egg, Cheese & Cold Cuts',
      name: 'eggCheeseColdcuts',
      desc: '',
      args: [],
    );
  }

  /// `Bakeries & Pastries`
  String get bakeriesPastries {
    return Intl.message(
      'Bakeries & Pastries',
      name: 'bakeriesPastries',
      desc: '',
      args: [],
    );
  }

  /// `Beverages`
  String get beverages {
    return Intl.message('Beverages', name: 'beverages', desc: '', args: []);
  }

  /// `Snacks`
  String get snacks {
    return Intl.message('Snacks', name: 'snacks', desc: '', args: []);
  }

  /// `Frozen`
  String get frozen {
    return Intl.message('Frozen', name: 'frozen', desc: '', args: []);
  }

  /// `House Cleaning`
  String get houseCleaning {
    return Intl.message(
      'House Cleaning',
      name: 'houseCleaning',
      desc: '',
      args: [],
    );
  }

  /// `Beauty`
  String get beuty {
    return Intl.message('Beauty', name: 'beuty', desc: '', args: []);
  }

  /// `Pets Supplies`
  String get petsSupplies {
    return Intl.message(
      'Pets Supplies',
      name: 'petsSupplies',
      desc: '',
      args: [],
    );
  }

  /// `Chocolate`
  String get chocolate {
    return Intl.message('Chocolate', name: 'chocolate', desc: '', args: []);
  }

  /// `Galaxy Chocolate Vegan (75g)`
  String get galaxy_chocolate_vegan {
    return Intl.message(
      'Galaxy Chocolate Vegan (75g)',
      name: 'galaxy_chocolate_vegan',
      desc: '',
      args: [],
    );
  }

  /// `Galaxy Dark Chocolate 70% cocoa (75g)`
  String get galaxy_dark_chocolate_70_cocoa {
    return Intl.message(
      'Galaxy Dark Chocolate 70% cocoa (75g)',
      name: 'galaxy_dark_chocolate_70_cocoa',
      desc: '',
      args: [],
    );
  }

  /// `Galaxy Chocolate Vegan Gluten Free (75g)`
  String get galaxy_chocolate {
    return Intl.message(
      'Galaxy Chocolate Vegan Gluten Free (75g)',
      name: 'galaxy_chocolate',
      desc: '',
      args: [],
    );
  }

  /// `Kinder Chocolate Maxi 4pcs (96g)`
  String get kinder_chocolate_maxi {
    return Intl.message(
      'Kinder Chocolate Maxi 4pcs (96g)',
      name: 'kinder_chocolate_maxi',
      desc: '',
      args: [],
    );
  }

  /// `Kinder Chocolate Bueno 10pcs (100g)`
  String get kinder_chocolate_bueno {
    return Intl.message(
      'Kinder Chocolate Bueno 10pcs (100g)',
      name: 'kinder_chocolate_bueno',
      desc: '',
      args: [],
    );
  }

  /// `Kinder Chocolate Bueno Mini 10pcs (100g)`
  String get kinder_chocolate_bueno_mini {
    return Intl.message(
      'Kinder Chocolate Bueno Mini 10pcs (100g)',
      name: 'kinder_chocolate_bueno_mini',
      desc: '',
      args: [],
    );
  }

  /// `Cadbury dairy Milk Oreo Chocolate Bar (95g)`
  String get cadbury_dairy_milk_oreo {
    return Intl.message(
      'Cadbury dairy Milk Oreo Chocolate Bar (95g)',
      name: 'cadbury_dairy_milk_oreo',
      desc: '',
      args: [],
    );
  }

  /// `Cadbury dairy Milk Caramel Chocolate Bar (130g)`
  String get cadbury_dairy_milk_caramel {
    return Intl.message(
      'Cadbury dairy Milk Caramel Chocolate Bar (130g)',
      name: 'cadbury_dairy_milk_caramel',
      desc: '',
      args: [],
    );
  }

  /// `Cadbury dairy Milk Chocolate Bar (86g)`
  String get cadbury_dairy_milk {
    return Intl.message(
      'Cadbury dairy Milk Chocolate Bar (86g)',
      name: 'cadbury_dairy_milk',
      desc: '',
      args: [],
    );
  }

  /// `Galaxy Fusions Raspberry Meringue`
  String get galaxy_fusions_raspberry {
    return Intl.message(
      'Galaxy Fusions Raspberry Meringue',
      name: 'galaxy_fusions_raspberry',
      desc: '',
      args: [],
    );
  }

  /// `Galaxy Fusions Dark Chocolate 70% Cocoa`
  String get galaxy_fusions_dark_chocolate {
    return Intl.message(
      'Galaxy Fusions Dark Chocolate 70% Cocoa',
      name: 'galaxy_fusions_dark_chocolate',
      desc: '',
      args: [],
    );
  }

  /// `Galaxy Fusions Sea Salt`
  String get galaxy_fusions_sea_salt {
    return Intl.message(
      'Galaxy Fusions Sea Salt',
      name: 'galaxy_fusions_sea_salt',
      desc: '',
      args: [],
    );
  }

  /// `EGP 110.00`
  String get price_galaxy_dark_70 {
    return Intl.message(
      'EGP 110.00',
      name: 'price_galaxy_dark_70',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy our velvety 70% cocoa galaxy dark chocolate. Packed full with chocolatey richness that melts in your mouth with its buttery texture. Made with no added compounds or vegetable fats`
  String get description_galaxy_dark {
    return Intl.message(
      'Enjoy our velvety 70% cocoa galaxy dark chocolate. Packed full with chocolatey richness that melts in your mouth with its buttery texture. Made with no added compounds or vegetable fats',
      name: 'description_galaxy_dark',
      desc: '',
      args: [],
    );
  }

  /// `100.00`
  String get price_1 {
    return Intl.message('100.00', name: 'price_1', desc: '', args: []);
  }

  /// `110.00`
  String get price_2 {
    return Intl.message('110.00', name: 'price_2', desc: '', args: []);
  }

  /// `100.00`
  String get price_3 {
    return Intl.message('100.00', name: 'price_3', desc: '', args: []);
  }

  /// `100.00`
  String get price_4 {
    return Intl.message('100.00', name: 'price_4', desc: '', args: []);
  }

  /// `190.00`
  String get price_5 {
    return Intl.message('190.00', name: 'price_5', desc: '', args: []);
  }

  /// `120.00`
  String get price_6 {
    return Intl.message('120.00', name: 'price_6', desc: '', args: []);
  }

  /// `67.00`
  String get price_7 {
    return Intl.message('67.00', name: 'price_7', desc: '', args: []);
  }

  /// `105.25`
  String get price_8 {
    return Intl.message('105.25', name: 'price_8', desc: '', args: []);
  }

  /// `44.25`
  String get price_9 {
    return Intl.message('44.25', name: 'price_9', desc: '', args: []);
  }

  /// `Add To Cart`
  String get addToCart {
    return Intl.message('Add To Cart', name: 'addToCart', desc: '', args: []);
  }

  /// `pc`
  String get pc {
    return Intl.message('pc', name: 'pc', desc: '', args: []);
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `EGP`
  String get egp {
    return Intl.message('EGP', name: 'egp', desc: '', args: []);
  }

  /// `No Favorites Yet`
  String get noFavYet {
    return Intl.message(
      'No Favorites Yet',
      name: 'noFavYet',
      desc: '',
      args: [],
    );
  }

  /// `No Items in Cart`
  String get noItemsInCart {
    return Intl.message(
      'No Items in Cart',
      name: 'noItemsInCart',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `Checkout`
  String get checkout {
    return Intl.message('Checkout', name: 'checkout', desc: '', args: []);
  }

  /// `Continue Shopping`
  String get continueShopping {
    return Intl.message(
      'Continue Shopping',
      name: 'continueShopping',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
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
