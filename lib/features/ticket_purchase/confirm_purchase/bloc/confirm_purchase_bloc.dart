import 'package:bloc/bloc.dart';
import 'package:evenue/features/ticket_purchase/utils/ticket_purchase/ticket_purchase.dart';
import 'package:evenue/features/ticket_purchase/utils/ticket_purchase_error.dart';
import 'package:meta/meta.dart';

part 'confirm_purchase_event.dart';
part 'confirm_purchase_state.dart';

class ConfirmPurchaseBloc extends Bloc<ConfirmPurchaseEvent, ConfirmPurchaseState> {
  final TicketPurchase _ticketPurchase;
  final String _paymentId;

  ConfirmPurchaseBloc(TicketPurchase ticketPurchase, String paymentId)
      : _ticketPurchase = ticketPurchase,
        _paymentId = paymentId,
        super(ConfirmPurchaseEnterCodeState()) {
    on<ConfirmPurchaseSendCodeEvent>(_sendCode);
  }

  Future<void> _sendCode(
    ConfirmPurchaseSendCodeEvent event,
    Emitter<ConfirmPurchaseState> emit,
  ) async {
    try {
      await _ticketPurchase.confirmPurchase(
        _paymentId,
        event.confirmationCode,
      );

      emit(ConfirmPurchaseSuccessfullyState());
    } on TicketPurchaseError catch (e) {
      emit(ConfirmPurchaseErrorState(e));
    } catch (_) {
      emit(ConfirmPurchaseErrorState(TicketPurchaseUnknownError()));
    }
  }
}
