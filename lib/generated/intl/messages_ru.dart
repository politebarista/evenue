// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
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
  String get localeName => 'ru';

  static String m0(eventName) =>
      "После ввода кода и нажатия на кнопку \"Подтвердить покупку\" вы приобретёте билеты на мероприятие \"${eventName}\"";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "confirmPurchaseConfirmButton":
            MessageLookupByLibrary.simpleMessage("Подтвердить покупку"),
        "confirmPurchaseConfirmationCodeFieldLabel":
            MessageLookupByLibrary.simpleMessage("Код подтверждения"),
        "confirmPurchaseDescription": m0,
        "confirmPurchaseDescriptionWithoutEventName":
            MessageLookupByLibrary.simpleMessage(
                "После ввода кода и нажатия на кнопку \"Подтвердить покупку\" вы приобретёте билеты на мероприятие"),
        "confirmPurchaseErrorDialogButton":
            MessageLookupByLibrary.simpleMessage("Ок"),
        "confirmPurchaseErrorDialogTitle":
            MessageLookupByLibrary.simpleMessage("Упс.. Ошибка"),
        "confirmPurchaseIncorrectConfirmationCodeError":
            MessageLookupByLibrary.simpleMessage(
                "Проверьте правильность введённого кода"),
        "confirmPurchaseSuccessfullyPurchaseDialogButton":
            MessageLookupByLibrary.simpleMessage("Ок"),
        "confirmPurchaseSuccessfullyPurchaseDialogDescription":
            MessageLookupByLibrary.simpleMessage(
                "Билет был успешно приобретен. Спасибо за покупку"),
        "confirmPurchaseSuccessfullyPurchaseDialogTitle":
            MessageLookupByLibrary.simpleMessage("Билет приобретен"),
        "confirmPurchaseTitle":
            MessageLookupByLibrary.simpleMessage("Подтверждение покупки"),
        "enteringPurchaseDataCardCVVFieldLabel":
            MessageLookupByLibrary.simpleMessage("CVV"),
        "enteringPurchaseDataCardCVVValidateError":
            MessageLookupByLibrary.simpleMessage("Неверный CVV"),
        "enteringPurchaseDataCardExpirationDateFieldHint":
            MessageLookupByLibrary.simpleMessage("ММ/ГГ"),
        "enteringPurchaseDataCardExpirationDateFieldLabel":
            MessageLookupByLibrary.simpleMessage("Срок действия карты"),
        "enteringPurchaseDataCardExpirationDateValidateError":
            MessageLookupByLibrary.simpleMessage(
                "Неверный срок действия карты"),
        "enteringPurchaseDataCardHolderFieldLabel":
            MessageLookupByLibrary.simpleMessage("Имя держателя карты"),
        "enteringPurchaseDataCardHolderValidateError":
            MessageLookupByLibrary.simpleMessage(
                "Неверное имя держателя карты"),
        "enteringPurchaseDataCardNumberFieldLabel":
            MessageLookupByLibrary.simpleMessage("Номер карты"),
        "enteringPurchaseDataCardNumberValidateError":
            MessageLookupByLibrary.simpleMessage("Неверный номер карты"),
        "enteringPurchaseDataContinueButton":
            MessageLookupByLibrary.simpleMessage("Продолжить"),
        "enteringPurchaseDataEmailFieldLabel":
            MessageLookupByLibrary.simpleMessage("Email"),
        "enteringPurchaseDataEmailValidateError":
            MessageLookupByLibrary.simpleMessage("Неверный Email"),
        "enteringPurchaseDataErrorDialogButton":
            MessageLookupByLibrary.simpleMessage("Ок"),
        "enteringPurchaseDataErrorDialogTitle":
            MessageLookupByLibrary.simpleMessage("Ошибка"),
        "eventDetailsBuyTicketAvailableButton":
            MessageLookupByLibrary.simpleMessage("Купить билет"),
        "eventDetailsBuyTicketUnavailableButton":
            MessageLookupByLibrary.simpleMessage("Нет билетов в продаже"),
        "eventDetailsLoadingEventInfoErrorDialogDescription":
            MessageLookupByLibrary.simpleMessage(
                "Данного мероприятия нет. Возможно оно было отменено"),
        "eventDetailsLoadingEventInfoErrorDialogOkButton":
            MessageLookupByLibrary.simpleMessage("Ок"),
        "eventDetailsLoadingEventInfoErrorDialogTitle":
            MessageLookupByLibrary.simpleMessage("Упс.. Ошибка"),
        "eventDetailsTicketPurchaseUserNotAuthorizedErrorButton":
            MessageLookupByLibrary.simpleMessage("Ок"),
        "eventDetailsTicketPurchaseUserNotAuthorizedErrorDescription":
            MessageLookupByLibrary.simpleMessage(
                "Для совершения покупки билета пожалуйста сначала авторизуйтесь или зарегистрируйтесь"),
        "eventDetailsTicketPurchaseUserNotAuthorizedErrorTitle":
            MessageLookupByLibrary.simpleMessage("Необходима авторизация"),
        "evenueDialogDefaultButton": MessageLookupByLibrary.simpleMessage("Ок"),
        "ticketPurchaseIncorrectConfirmationPurchaseCodeError":
            MessageLookupByLibrary.simpleMessage(
                "Код подтверждения покупки был введён неверно"),
        "ticketPurchaseIncorrectCustomerInformationError":
            MessageLookupByLibrary.simpleMessage(
                "Пользователя с таким Email нет. Пожалуйста авторизуйтесь перед покупкой"),
        "ticketPurchaseIncorrectEventInformationError":
            MessageLookupByLibrary.simpleMessage(
                "Данного мероприятия нет. Возможно оно было отменено"),
        "ticketPurchaseIncorrectPaymentCardInformationError":
            MessageLookupByLibrary.simpleMessage(
                "Реквизиты банковской карты введены неверное. Пожалуйста проверьте их"),
        "ticketPurchaseNoAwaitingPaymentTicketError":
            MessageLookupByLibrary.simpleMessage(
                "Во время покупки билета произошла ошибка. Возможно вы потратили на ввод кода подтверждение более 15 минут. Пожалуйста попробуйте ещё раз"),
        "ticketPurchaseNoTicketsLeftForEventError":
            MessageLookupByLibrary.simpleMessage(
                "Все билеты на это мероприятие были распроданы"),
        "ticketPurchaseUnknownError": MessageLookupByLibrary.simpleMessage(
            "Во время покупки билета произошла непредвиденная ошибка. Пожалуйста попробуйте позже")
      };
}
