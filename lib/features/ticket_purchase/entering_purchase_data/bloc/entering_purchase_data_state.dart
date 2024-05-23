part of 'entering_purchase_data_bloc.dart';

@immutable
sealed class EnteringPurchaseDataState {}

final class EnteringPurchaseDataPendingState extends EnteringPurchaseDataState {}

final class EnteringPurchaseDataEnterDataState extends EnteringPurchaseDataState {}

final class EnteringPurchaseDataSuccessfullyState extends EnteringPurchaseDataState {
  final String paymentId;

  EnteringPurchaseDataSuccessfullyState(this.paymentId);
}

final class EnteringPurchaseDataErrorState extends EnteringPurchaseDataState {
  final TicketPurchaseError error;

  EnteringPurchaseDataErrorState(this.error);
}
