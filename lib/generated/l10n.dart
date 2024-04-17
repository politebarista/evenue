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

  /// `Buy a ticket`
  String get eventDetailsBuyTicketButton {
    return Intl.message(
      'Buy a ticket',
      name: 'eventDetailsBuyTicketButton',
      desc: '',
      args: [],
    );
  }

  /// `Authorization is required`
  String get eventDetailsTicketPurchaseUserNotAuthorizedErrorTitle {
    return Intl.message(
      'Authorization is required',
      name: 'eventDetailsTicketPurchaseUserNotAuthorizedErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `To purchase a ticket, please log in or register first`
  String get eventDetailsTicketPurchaseUserNotAuthorizedErrorDescription {
    return Intl.message(
      'To purchase a ticket, please log in or register first',
      name: 'eventDetailsTicketPurchaseUserNotAuthorizedErrorDescription',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get eventDetailsTicketPurchaseUserNotAuthorizedErrorButton {
    return Intl.message(
      'OK',
      name: 'eventDetailsTicketPurchaseUserNotAuthorizedErrorButton',
      desc: '',
      args: [],
    );
  }

  /// `Card number`
  String get enteringPurchaseDataCardNumberFieldLabel {
    return Intl.message(
      'Card number',
      name: 'enteringPurchaseDataCardNumberFieldLabel',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect card number`
  String get enteringPurchaseDataCardNumberValidateError {
    return Intl.message(
      'Incorrect card number',
      name: 'enteringPurchaseDataCardNumberValidateError',
      desc: '',
      args: [],
    );
  }

  /// `Card expiration date`
  String get enteringPurchaseDataCardExpirationDateFieldLabel {
    return Intl.message(
      'Card expiration date',
      name: 'enteringPurchaseDataCardExpirationDateFieldLabel',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect card expiration date`
  String get enteringPurchaseDataCardExpirationDateValidateError {
    return Intl.message(
      'Incorrect card expiration date',
      name: 'enteringPurchaseDataCardExpirationDateValidateError',
      desc: '',
      args: [],
    );
  }

  /// `MM/YY`
  String get enteringPurchaseDataCardExpirationDateFieldHint {
    return Intl.message(
      'MM/YY',
      name: 'enteringPurchaseDataCardExpirationDateFieldHint',
      desc: '',
      args: [],
    );
  }

  /// `CVV`
  String get enteringPurchaseDataCardCVVFieldLabel {
    return Intl.message(
      'CVV',
      name: 'enteringPurchaseDataCardCVVFieldLabel',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect CVV`
  String get enteringPurchaseDataCardCVVValidateError {
    return Intl.message(
      'Incorrect CVV',
      name: 'enteringPurchaseDataCardCVVValidateError',
      desc: '',
      args: [],
    );
  }

  /// `Card holder name`
  String get enteringPurchaseDataCardHolderFieldLabel {
    return Intl.message(
      'Card holder name',
      name: 'enteringPurchaseDataCardHolderFieldLabel',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect card holder name`
  String get enteringPurchaseDataCardHolderValidateError {
    return Intl.message(
      'Incorrect card holder name',
      name: 'enteringPurchaseDataCardHolderValidateError',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get enteringPurchaseDataEmailFieldLabel {
    return Intl.message(
      'Email',
      name: 'enteringPurchaseDataEmailFieldLabel',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect Email`
  String get enteringPurchaseDataEmailValidateError {
    return Intl.message(
      'Incorrect Email',
      name: 'enteringPurchaseDataEmailValidateError',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get enteringPurchaseDataContinueButton {
    return Intl.message(
      'Continue',
      name: 'enteringPurchaseDataContinueButton',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get enteringPurchaseDataErrorDialogTitle {
    return Intl.message(
      'Error',
      name: 'enteringPurchaseDataErrorDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get enteringPurchaseDataErrorDialogButton {
    return Intl.message(
      'OK',
      name: 'enteringPurchaseDataErrorDialogButton',
      desc: '',
      args: [],
    );
  }

  /// `All tickets for this event were sold out`
  String get ticketPurchaseNoTicketsLeftForEventError {
    return Intl.message(
      'All tickets for this event were sold out',
      name: 'ticketPurchaseNoTicketsLeftForEventError',
      desc: '',
      args: [],
    );
  }

  /// `The bank card details are entered incorrectly. Please check them out`
  String get ticketPurchaseIncorrectPaymentCardInformationError {
    return Intl.message(
      'The bank card details are entered incorrectly. Please check them out',
      name: 'ticketPurchaseIncorrectPaymentCardInformationError',
      desc: '',
      args: [],
    );
  }

  /// `There is no such event. It may have been canceled`
  String get ticketPurchaseIncorrectEventInformationError {
    return Intl.message(
      'There is no such event. It may have been canceled',
      name: 'ticketPurchaseIncorrectEventInformationError',
      desc: '',
      args: [],
    );
  }

  /// `There is no user with this Email address. Please log in before purchasing`
  String get ticketPurchaseIncorrectCustomerInformationError {
    return Intl.message(
      'There is no user with this Email address. Please log in before purchasing',
      name: 'ticketPurchaseIncorrectCustomerInformationError',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected error occurred during the purchase of the ticket. Please try again later`
  String get ticketPurchaseUnknownError {
    return Intl.message(
      'An unexpected error occurred during the purchase of the ticket. Please try again later',
      name: 'ticketPurchaseUnknownError',
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
      Locale.fromSubtags(languageCode: 'ru'),
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
