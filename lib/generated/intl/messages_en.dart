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

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "enteringPurchaseDataCardCVVFieldLabel":
            MessageLookupByLibrary.simpleMessage("CVV"),
        "enteringPurchaseDataCardCVVValidateError":
            MessageLookupByLibrary.simpleMessage("Incorrect CVV"),
        "enteringPurchaseDataCardExpirationDateFieldHint":
            MessageLookupByLibrary.simpleMessage("MM/YY"),
        "enteringPurchaseDataCardExpirationDateFieldLabel":
            MessageLookupByLibrary.simpleMessage("Card expiration date"),
        "enteringPurchaseDataCardExpirationDateValidateError":
            MessageLookupByLibrary.simpleMessage(
                "Incorrect card expiration date"),
        "enteringPurchaseDataCardHolderFieldLabel":
            MessageLookupByLibrary.simpleMessage("Card holder name"),
        "enteringPurchaseDataCardHolderValidateError":
            MessageLookupByLibrary.simpleMessage("Incorrect card holder name"),
        "enteringPurchaseDataCardNumberFieldLabel":
            MessageLookupByLibrary.simpleMessage("Card number"),
        "enteringPurchaseDataCardNumberValidateError":
            MessageLookupByLibrary.simpleMessage("Incorrect card number"),
        "enteringPurchaseDataContinueButton":
            MessageLookupByLibrary.simpleMessage("Continue"),
        "enteringPurchaseDataEmailFieldLabel":
            MessageLookupByLibrary.simpleMessage("Email"),
        "enteringPurchaseDataEmailValidateError":
            MessageLookupByLibrary.simpleMessage("Incorrect Email"),
        "enteringPurchaseDataErrorDialogButton":
            MessageLookupByLibrary.simpleMessage("OK"),
        "enteringPurchaseDataErrorDialogTitle":
            MessageLookupByLibrary.simpleMessage("Error"),
        "eventDetailsBuyTicketButton":
            MessageLookupByLibrary.simpleMessage("Buy a ticket"),
        "eventDetailsTicketPurchaseUserNotAuthorizedErrorButton":
            MessageLookupByLibrary.simpleMessage("OK"),
        "eventDetailsTicketPurchaseUserNotAuthorizedErrorDescription":
            MessageLookupByLibrary.simpleMessage(
                "To purchase a ticket, please log in or register first"),
        "eventDetailsTicketPurchaseUserNotAuthorizedErrorTitle":
            MessageLookupByLibrary.simpleMessage("Authorization is required"),
        "ticketPurchaseIncorrectCustomerInformationError":
            MessageLookupByLibrary.simpleMessage(
                "There is no user with this Email address. Please log in before purchasing"),
        "ticketPurchaseIncorrectEventInformationError":
            MessageLookupByLibrary.simpleMessage(
                "There is no such event. It may have been canceled"),
        "ticketPurchaseIncorrectPaymentCardInformationError":
            MessageLookupByLibrary.simpleMessage(
                "The bank card details are entered incorrectly. Please check them out"),
        "ticketPurchaseNoTicketsLeftForEventError":
            MessageLookupByLibrary.simpleMessage(
                "All tickets for this event were sold out"),
        "ticketPurchaseUnknownError": MessageLookupByLibrary.simpleMessage(
            "An unexpected error occurred during the purchase of the ticket. Please try again later")
      };
}
