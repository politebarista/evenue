import 'package:evenue/common/ui/custom_text_field.dart';
import 'package:evenue/common/ui/evenue_button.dart';
import 'package:evenue/common/ui/evenue_dialog.dart';
import 'package:evenue/common/ui/indent_widget.dart';
import 'package:evenue/features/ticket_purchase/confirm_purchase/bloc/confirm_purchase_bloc.dart';
import 'package:evenue/features/ticket_purchase/utils/ticket_purchase/ticket_purchase.dart';
import 'package:evenue/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/ticket_purchase_error.dart';

part 'view/confirm_purchase_enter_code_widget.dart';

class ConfirmPurchaseScreen extends StatelessWidget {
  final String paymentId;

  const ConfirmPurchaseScreen(this.paymentId, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider<ConfirmPurchaseBloc>(
        create: (context) => ConfirmPurchaseBloc(
          context.read<TicketPurchase>(),
          paymentId,
        ),
        child: BlocConsumer<ConfirmPurchaseBloc, ConfirmPurchaseState>(
          buildWhen: (_, current) => current is ConfirmPurchaseEnterCodeState,
          listenWhen: (_, current) => current is ConfirmPurchaseErrorState ||
            current is ConfirmPurchaseSuccessfullyState,
          builder: (context, state) {
            if (state is ConfirmPurchaseEnterCodeState) {
              return _ConfirmPurchaseEnterCodeWidget();
            } else {
              throw UnimplementedError();
            }
          },
          listener: (context, state) {
            if (state is ConfirmPurchaseErrorState) {
              final errorText = switch (state.error) {
                NoAwaitingPaymentTicketError _ => S.of(context).ticketPurchaseNoAwaitingPaymentTicketError,
                IncorrectConfirmationPurchaseCodeError _ => S.of(context).ticketPurchaseIncorrectConfirmationPurchaseCodeError,
                NoTicketsLeftForEventError _ => S.of(context).ticketPurchaseNoTicketsLeftForEventError,
                IncorrectEventInformationError _ => S.of(context).ticketPurchaseIncorrectEventInformationError,
                _ => S.of(context).ticketPurchaseUnknownError,
              };
              final isErrorCritical = switch (state.error) {
                IncorrectConfirmationPurchaseCodeError _ => false,
                _ => true,
              };

              showEvenueDialog<void>(
                context: context,
                title: S.of(context).confirmPurchaseErrorDialogTitle,
                content: errorText,
                actions: [
                  EvenueDialogAction(
                    S.of(context).confirmPurchaseErrorDialogButton,
                    () {
                      Navigator.of(context, rootNavigator: true).pop();
                      if (isErrorCritical) Navigator.of(context, rootNavigator: true).pop();
                    },
                  ),
                ],
                canPop: false,
              );
            } else if (state is ConfirmPurchaseSuccessfullyState) {
              showEvenueDialog<void>(
                context: context,
                title: S.of(context).confirmPurchaseSuccessfullyPurchaseDialogTitle,
                content: S.of(context).confirmPurchaseSuccessfullyPurchaseDialogDescription,
                actions: [
                  EvenueDialogAction(
                    S.of(context).confirmPurchaseSuccessfullyPurchaseDialogButton,
                    () {
                      Navigator.of(context, rootNavigator: true)..pop()..pop();
                    },
                  ),
                ],
                canPop: false,
              );
            } else {
              throw UnimplementedError();
            }
          },
        ),
      ),
    );
  }
}
