import 'package:evenue/features/ticket_purchase/utils/ticket_purchase_error.dart';

final class TicketPurchaseErrorMapper {
  static const int _noAwaitingPaymentTicket = 631,
      _incorrectConfirmationPurchaseCode = 632,
      _noTicketsLeftForEvent = 633,
      _incorrectPaymentCardInformation = 634,
      _incorrectEventInformation = 635,
      _incorrectCustomerInformation = 636;

  TicketPurchaseErrorMapper._();

  static TicketPurchaseError? getErrorFromCode(String? errorCode) {
    if (errorCode == null) return null;

    final parsedErrorCode = int.tryParse(errorCode);
    if (parsedErrorCode is int) {
      if (parsedErrorCode < 631 || parsedErrorCode > 640) return null;

      final error = switch (parsedErrorCode) {
        _noAwaitingPaymentTicket => NoAwaitingPaymentTicketError(),
        _incorrectConfirmationPurchaseCode => IncorrectConfirmationPurchaseCodeError(),
        _noTicketsLeftForEvent => NoTicketsLeftForEventError(),
        _incorrectPaymentCardInformation => IncorrectPaymentCardInformationError(),
        _incorrectEventInformation => IncorrectEventInformationError(),
        _incorrectCustomerInformation => IncorrectCustomerInformationError(),
        _ => throw UnimplementedError(),
      };

      return error;
    } else {
      return null;
    }
  }
}
