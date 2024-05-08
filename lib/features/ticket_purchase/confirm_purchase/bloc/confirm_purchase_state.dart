part of 'confirm_purchase_bloc.dart';

@immutable
sealed class ConfirmPurchaseState {}

final class ConfirmPurchaseEnterCodeState extends ConfirmPurchaseState {}

final class ConfirmPurchaseErrorState extends ConfirmPurchaseState {
  final TicketPurchaseError error;

  ConfirmPurchaseErrorState(this.error);
}

final class ConfirmPurchaseSuccessfullyState extends ConfirmPurchaseState {}
