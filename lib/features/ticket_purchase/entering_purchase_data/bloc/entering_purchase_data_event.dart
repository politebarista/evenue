part of 'entering_purchase_data_bloc.dart';

@immutable
sealed class EnteringPurchaseDataEvent {}

class _CheckPurchaseOption extends EnteringPurchaseDataEvent {
  final String eventId;

  _CheckPurchaseOption(this.eventId);
}

// ignore: prefer-correct-type-name
class EnteringPurchaseDataSendPurchaseDataEvent extends EnteringPurchaseDataEvent {
  final BankCard bankCard;
  final String customerEmail;

  EnteringPurchaseDataSendPurchaseDataEvent(
    this.bankCard,
    this.customerEmail,
  );
}
