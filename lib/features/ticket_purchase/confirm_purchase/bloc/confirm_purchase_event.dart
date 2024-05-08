part of 'confirm_purchase_bloc.dart';

@immutable
sealed class ConfirmPurchaseEvent {}

class ConfirmPurchaseSendCodeEvent extends ConfirmPurchaseEvent {
  final String confirmationCode;

  ConfirmPurchaseSendCodeEvent(this.confirmationCode);
}