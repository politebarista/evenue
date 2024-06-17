import 'package:bloc/bloc.dart';
import 'package:evenue/error_logger/error_logger.dart';
import 'package:evenue/features/ticket_purchase/utils/ticket_purchase/ticket_purchase.dart';
import 'package:evenue/features/ticket_purchase/utils/ticket_purchase_error.dart';
import 'package:meta/meta.dart';

part 'entering_purchase_data_event.dart';

part 'entering_purchase_data_state.dart';

class EnteringPurchaseDataBloc extends Bloc<EnteringPurchaseDataEvent, EnteringPurchaseDataState> {
  final ErrorLogger _errorLogger;
  final TicketPurchase _ticketPurchase;
  final String _eventId;

  EnteringPurchaseDataBloc(
    ErrorLogger errorLogger,
    TicketPurchase ticketPurchase,
    String eventId,
  )   : _errorLogger = errorLogger,
        _ticketPurchase = ticketPurchase,
        _eventId = eventId,
        super(EnteringPurchaseDataPendingState()) {
    on<_CheckPurchaseOption>(_checkPurchaseOption);
    on<EnteringPurchaseDataSendPurchaseDataEvent>(_sendPurchaseData);

    add(_CheckPurchaseOption(eventId));
  }

  _checkPurchaseOption(
    _CheckPurchaseOption event,
    Emitter<EnteringPurchaseDataState> emit,
  ) async {
    try {
      final isPurchaseAvailable = await _ticketPurchase.checkPurchaseOption(
        event.eventId,
      );

      emit(
        isPurchaseAvailable
            ? EnteringPurchaseDataEnterDataState()
            : EnteringPurchaseDataErrorState(NoTicketsLeftForEventError()),
      );
    } on TicketPurchaseError catch (e, stackTrace) {
      await _errorLogger.sendError(e, stackTrace);
      emit(EnteringPurchaseDataErrorState(e));
    } catch (e, stackTrace) {
      await _errorLogger.sendError(e, stackTrace);
      emit(EnteringPurchaseDataErrorState(TicketPurchaseUnknownError()));
    }
  }

  _sendPurchaseData(
    EnteringPurchaseDataSendPurchaseDataEvent event,
    Emitter<EnteringPurchaseDataState> emit,
  ) async {
    try {
      final paymentId = await _ticketPurchase.bookTicketAndGetPaymentId(
        event.bankCard,
        _eventId,
        event.customerEmail,
      );

      emit(EnteringPurchaseDataSuccessfullyState(paymentId));
    } on TicketPurchaseError catch (e, stackTrace) {
      await _errorLogger.sendError(e, stackTrace);
      emit(EnteringPurchaseDataErrorState(e));
    } catch (e, stackTrace) {
      await _errorLogger.sendError(e, stackTrace);
      emit(EnteringPurchaseDataErrorState(TicketPurchaseUnknownError()));
    }
  }
}
