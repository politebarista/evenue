import 'package:evenue/common/config.dart';
import 'package:evenue/common/email_helper.dart';
import 'package:evenue/common/ui/custom_text_field.dart';
import 'package:evenue/common/ui/evenue_button.dart';
import 'package:evenue/common/ui/indent_widget.dart';
import 'package:evenue/common/ui/pending_widget.dart';
import 'package:evenue/common/ui/upper_case_text_input_formatter.dart';
import 'package:evenue/features/ticket_purchase/entering_purchase_data/bloc/entering_purchase_data_bloc.dart';
import 'package:evenue/features/ticket_purchase/utils/ticket_purchase/server_ticket_purchase.dart';
import 'package:evenue/features/ticket_purchase/utils/ticket_purchase/ticket_purchase.dart';
import 'package:evenue/features/ticket_purchase/utils/ticket_purchase_error.dart';
import 'package:evenue/generated/l10n.dart';
import 'package:evenue/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

part 'view/entering_purchase_data_enter_data_widget.dart';

class EnteringPurchaseDataScreen extends StatelessWidget {
  final String eventId;
  final String eventName;

  const EnteringPurchaseDataScreen(this.eventId, this.eventName, {super.key});

  void _showErrorDialog(
    final BuildContext context,
    final String content,
    final bool isCritical,
  ) =>
      showPlatformDialog(
        context: context,
        builder: (_) => BasicDialogAlert(
          title: Text(
            S.of(context).enteringPurchaseDataErrorDialogTitle,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          content: Text(
            content,
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            BasicDialogAction(
              title: Text(S.of(context).enteringPurchaseDataErrorDialogButton),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
                if (isCritical) Navigator.of(context, rootNavigator: true).pop();
              },
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    final TicketPurchase ticketPurchase = ServerTicketPurchase(
      context.read<Config>().appDef,
    );

    return Scaffold(
      appBar: AppBar(title: Text(eventName)),
      body: SafeArea(
        child: BlocProvider<EnteringPurchaseDataBloc>(
          create: (_) => EnteringPurchaseDataBloc(ticketPurchase, eventId),
          child: BlocConsumer<EnteringPurchaseDataBloc, EnteringPurchaseDataState>(
            buildWhen: (_, current) => current is EnteringPurchaseDataPendingState ||
              current is EnteringPurchaseDataEnterDataState,
            listenWhen: (_, current) => current is EnteringPurchaseDataErrorState ||
              current is EnteringPurchaseDataSuccessfullyState,
            builder: (context, state) {
              if (state is EnteringPurchaseDataPendingState) {
                return Center(child: PendingWidget());
              } else if (state is EnteringPurchaseDataEnterDataState) {
                return _EnteringPurchaseDataEnterDataWidget();
              } else {
                throw UnimplementedError();
              }
            },
            listener: (context, state) {
              if (state is EnteringPurchaseDataErrorState) {
                final errorText = switch (state.error) {
                  NoTicketsLeftForEventError _ => S.of(context).ticketPurchaseNoTicketsLeftForEventError,
                  IncorrectPaymentCardInformationError _ => S.of(context).ticketPurchaseIncorrectPaymentCardInformationError,
                  IncorrectEventInformationError _ => S.of(context).ticketPurchaseIncorrectEventInformationError,
                  IncorrectCustomerInformationError _ => S.of(context).ticketPurchaseIncorrectCustomerInformationError,
                  _ => S.of(context).ticketPurchaseUnknownError,
                };
                final isErrorCritical = switch (state.error) {
                  IncorrectPaymentCardInformationError _ => false,
                  IncorrectCustomerInformationError _ => false,
                  _ => true,
                };

                _showErrorDialog(context, errorText, isErrorCritical);
              } else if (state is EnteringPurchaseDataSuccessfullyState) {
                print('all successful - payment id is ${state.paymentId}');
              } else {
                throw UnimplementedError();
              }
            },
          ),
        ),
      ),
    );
  }
}
