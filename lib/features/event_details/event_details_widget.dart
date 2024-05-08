import 'package:cached_network_image/cached_network_image.dart';
import 'package:evenue/common/constants.dart';
import 'package:evenue/common/event_date_helper.dart';
import 'package:evenue/common/price_formatter.dart';
import 'package:evenue/common/ui/common_ui_provider.dart';
import 'package:evenue/common/ui/constants.dart';
import 'package:evenue/common/ui/custom_color_scheme.dart';
import 'package:evenue/common/ui/custom_text_styles.dart';
import 'package:evenue/common/ui/evenue_button.dart';
import 'package:evenue/common/ui/indent_widget.dart';
import 'package:evenue/features/ticket_purchase/ticket_purchase_screen.dart';
import 'package:evenue/generated/l10n.dart';
import 'package:evenue/models/event.dart';
import 'package:evenue/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:provider/provider.dart';

class EventDetailsWidget extends StatelessWidget {
  final Event event;

  const EventDetailsWidget(this.event, {Key? key}) : super(key: key);

  void _onBuyTicketButtonPressed(BuildContext context) {
    if (context.read<UserStore>().isUserAuthorized) {
      Navigator.of(context).push<void>(
        MaterialPageRoute(
          builder: (context) => TicketPurchaseScreen(
            eventId: event.id,
            eventName: event.name,
          ),
        ),
      );
    } else {
      showPlatformDialog<void>(
        context: context,
        builder: (_) => BasicDialogAlert(
          title: Text(
            S.of(context).eventDetailsTicketPurchaseUserNotAuthorizedErrorTitle,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          content: Text(
            S.of(context).eventDetailsTicketPurchaseUserNotAuthorizedErrorDescription,
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            BasicDialogAction(
              title: Text(S.of(context).eventDetailsTicketPurchaseUserNotAuthorizedErrorButton),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          Icon(
            Icons.star_outline_rounded,
            color: CustomColorScheme.backgroundColor,
            size: 30,
          ),
          SizedBox(width: 12),
        ],
      ),
      body: IndentWidget(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Text(
                  event.name,
                  style: customTextStyles.title,
                ),
                SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(defaultBorderRadius - 1),
                  child: CachedNetworkImage(
                    imageUrl: event.imageUrl,
                    fit: BoxFit.cover,
                    errorWidget: (_, __, ___) => Image.asset(
                      noImagePlaceholderPath,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                commonUiProvider.divider,
                SizedBox(height: 8),
                Text(
                  event.description,
                  style: customTextStyles.description,
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Icon(
                      Icons.event,
                      color: CustomColorScheme.primaryColor,
                    ),
                    SizedBox(width: 8),
                    Text(
                      EventDateHelper.getDurationBetween(
                        event.startDate,
                        event.endDate,
                      ),
                      style: customTextStyles.description.copyWith(
                        color: CustomColorScheme.primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.paid_outlined,
                      color: CustomColorScheme.primaryColor,
                    ),
                    SizedBox(width: 8),
                    Text(
                      PriceFormatter.getFormattedPrice(event.price),
                      style: customTextStyles.description.copyWith(
                        color: CustomColorScheme.primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                EvenueButton(
                  onTap: () => _onBuyTicketButtonPressed(context),
                  text: S.of(context).eventDetailsBuyTicketButton,
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
