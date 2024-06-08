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

  /// `Sorting`
  String get eventsListSortButton {
    return Intl.message(
      'Sorting',
      name: 'eventsListSortButton',
      desc: '',
      args: [],
    );
  }

  /// `Sorting`
  String get eventsListSortingWidgetTitle {
    return Intl.message(
      'Sorting',
      name: 'eventsListSortingWidgetTitle',
      desc: '',
      args: [],
    );
  }

  /// `Ascending dates`
  String get eventsListSortingWidgetSortByDateAscending {
    return Intl.message(
      'Ascending dates',
      name: 'eventsListSortingWidgetSortByDateAscending',
      desc: '',
      args: [],
    );
  }

  /// `Descending dates`
  String get eventsListSortingWidgetSortByDateDescending {
    return Intl.message(
      'Descending dates',
      name: 'eventsListSortingWidgetSortByDateDescending',
      desc: '',
      args: [],
    );
  }

  /// `Ascending alphabet`
  String get eventsListSortingWidgetSortByNameAscending {
    return Intl.message(
      'Ascending alphabet',
      name: 'eventsListSortingWidgetSortByNameAscending',
      desc: '',
      args: [],
    );
  }

  /// `Descending alphabet`
  String get eventsListSortingWidgetSortByNameDescending {
    return Intl.message(
      'Descending alphabet',
      name: 'eventsListSortingWidgetSortByNameDescending',
      desc: '',
      args: [],
    );
  }

  /// `Buy a ticket`
  String get eventDetailsBuyTicketAvailableButton {
    return Intl.message(
      'Buy a ticket',
      name: 'eventDetailsBuyTicketAvailableButton',
      desc: '',
      args: [],
    );
  }

  /// `There are no tickets`
  String get eventDetailsBuyTicketUnavailableButton {
    return Intl.message(
      'There are no tickets',
      name: 'eventDetailsBuyTicketUnavailableButton',
      desc: '',
      args: [],
    );
  }

  /// `Oops.. Error`
  String get eventDetailsLoadingEventInfoErrorDialogTitle {
    return Intl.message(
      'Oops.. Error',
      name: 'eventDetailsLoadingEventInfoErrorDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `There is no such event. It may have been canceled`
  String get eventDetailsLoadingEventInfoErrorDialogDescription {
    return Intl.message(
      'There is no such event. It may have been canceled',
      name: 'eventDetailsLoadingEventInfoErrorDialogDescription',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get eventDetailsLoadingEventInfoErrorDialogOkButton {
    return Intl.message(
      'Ok',
      name: 'eventDetailsLoadingEventInfoErrorDialogOkButton',
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

  /// `An error occurred during the purchase of the ticket. You may have spent more than 15 minutes entering the confirmation code. Please try again`
  String get ticketPurchaseNoAwaitingPaymentTicketError {
    return Intl.message(
      'An error occurred during the purchase of the ticket. You may have spent more than 15 minutes entering the confirmation code. Please try again',
      name: 'ticketPurchaseNoAwaitingPaymentTicketError',
      desc: '',
      args: [],
    );
  }

  /// `The confirmation code was entered incorrectly`
  String get ticketPurchaseIncorrectConfirmationPurchaseCodeError {
    return Intl.message(
      'The confirmation code was entered incorrectly',
      name: 'ticketPurchaseIncorrectConfirmationPurchaseCodeError',
      desc: '',
      args: [],
    );
  }

  /// `Confirmation of purchase`
  String get confirmPurchaseTitle {
    return Intl.message(
      'Confirmation of purchase',
      name: 'confirmPurchaseTitle',
      desc: '',
      args: [],
    );
  }

  /// `After entering the code and pressing on the "Confirm purchase" button, you will purchase tickets for the event "{eventName}"`
  String confirmPurchaseDescription(Object eventName) {
    return Intl.message(
      'After entering the code and pressing on the "Confirm purchase" button, you will purchase tickets for the event "$eventName"',
      name: 'confirmPurchaseDescription',
      desc: '',
      args: [eventName],
    );
  }

  /// `After entering the code and pressing on the "Confirm purchase" button, you will purchase tickets for the event`
  String get confirmPurchaseDescriptionWithoutEventName {
    return Intl.message(
      'After entering the code and pressing on the "Confirm purchase" button, you will purchase tickets for the event',
      name: 'confirmPurchaseDescriptionWithoutEventName',
      desc: '',
      args: [],
    );
  }

  /// `Confirmation code`
  String get confirmPurchaseConfirmationCodeFieldLabel {
    return Intl.message(
      'Confirmation code',
      name: 'confirmPurchaseConfirmationCodeFieldLabel',
      desc: '',
      args: [],
    );
  }

  /// `Check the correctness of the entered code`
  String get confirmPurchaseIncorrectConfirmationCodeError {
    return Intl.message(
      'Check the correctness of the entered code',
      name: 'confirmPurchaseIncorrectConfirmationCodeError',
      desc: '',
      args: [],
    );
  }

  /// `Confirm the purchase`
  String get confirmPurchaseConfirmButton {
    return Intl.message(
      'Confirm the purchase',
      name: 'confirmPurchaseConfirmButton',
      desc: '',
      args: [],
    );
  }

  /// `The ticket has been purchased`
  String get confirmPurchaseSuccessfullyPurchaseDialogTitle {
    return Intl.message(
      'The ticket has been purchased',
      name: 'confirmPurchaseSuccessfullyPurchaseDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `The ticket was successfully purchased. Thanks for the purchase`
  String get confirmPurchaseSuccessfullyPurchaseDialogDescription {
    return Intl.message(
      'The ticket was successfully purchased. Thanks for the purchase',
      name: 'confirmPurchaseSuccessfullyPurchaseDialogDescription',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get confirmPurchaseSuccessfullyPurchaseDialogButton {
    return Intl.message(
      'Ok',
      name: 'confirmPurchaseSuccessfullyPurchaseDialogButton',
      desc: '',
      args: [],
    );
  }

  /// `Oops.. Error`
  String get confirmPurchaseErrorDialogTitle {
    return Intl.message(
      'Oops.. Error',
      name: 'confirmPurchaseErrorDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get confirmPurchaseErrorDialogButton {
    return Intl.message(
      'Ok',
      name: 'confirmPurchaseErrorDialogButton',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get evenueDialogDefaultButton {
    return Intl.message(
      'Ok',
      name: 'evenueDialogDefaultButton',
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
