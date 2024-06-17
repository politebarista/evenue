import 'package:cached_network_image/cached_network_image.dart';
import 'package:evenue/common/constants.dart';
import 'package:evenue/common/event_date_helper.dart';
import 'package:evenue/common/price_formatter.dart';
import 'package:evenue/common/ui/common_ui_provider.dart';
import 'package:evenue/common/ui/constants.dart';
import 'package:evenue/common/ui/custom_color_scheme.dart';
import 'package:evenue/common/ui/custom_text_styles.dart';
import 'package:evenue/common/ui/evenue_button.dart';
import 'package:evenue/common/ui/evenue_dialog.dart';
import 'package:evenue/common/ui/indent_widget.dart';
import 'package:evenue/common/ui/pending_widget.dart';
import 'package:evenue/error_logger/error_logger.dart';
import 'package:evenue/features/event_details/models/detailed_event.dart';
import 'package:evenue/features/ticket_purchase/ticket_purchase_screen.dart';
import 'package:evenue/generated/l10n.dart';
import 'package:evenue/models/event.dart';
import 'package:evenue/stores/repositories_store.dart';
import 'package:evenue/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
// ignore: unnecessary_import
import 'package:provider/provider.dart';

import 'bloc/event_details_bloc.dart';

part 'view/event_details_info_widget.dart';

class EventDetailsScreen extends StatelessWidget {
  final Event event;

  const EventDetailsScreen(this.event, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (_) => EventDetailsBloc(
          context.read<ErrorLogger>(),
          event,
          context.read<RepositoriesStore>().eventsRepository,
        )..add(EventDetailsLoadDetailsEvent(event)),
        child: BlocConsumer<EventDetailsBloc, EventDetailsState>(
          buildWhen: (_, current) => current is EventDetailsInfoState,
          listenWhen: (_, current) => current is EventDetailsErrorState,
          builder: (context, state) {
            if (state is EventDetailsInfoState) {
              return _EventDetailsInfoWidget(state.detailedEvent);
            } else {
              throw UnimplementedError();
            }
          },
          listener: (context, state) {
            if (state is EventDetailsErrorState) {
              showEvenueDialog<void>(
                context: context,
                title: S.of(context).eventDetailsLoadingEventInfoErrorDialogTitle,
                content: S.of(context).eventDetailsLoadingEventInfoErrorDialogDescription,
                actions: [
                  EvenueDialogAction(
                    S.of(context).eventDetailsLoadingEventInfoErrorDialogOkButton,
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
