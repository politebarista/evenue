part of '../event_details_screen.dart';

class _EventDetailsInfoWidget extends StatelessWidget {
  final DetailedEvent detailedEvent;

  const _EventDetailsInfoWidget(this.detailedEvent, {super.key});

  void _onBuyTicketButtonPressed(BuildContext context) {
    if (context.read<UserStore>().isUserAuthorized) {
      Navigator.of(context).push<void>(
        MaterialPageRoute(
          builder: (context) => TicketPurchaseScreen(
            eventId: detailedEvent.id,
            eventName: detailedEvent.name,
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
              title: Text(S
                  .of(context)
                  .eventDetailsTicketPurchaseUserNotAuthorizedErrorButton),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  bool get canTicketBePurchased =>
      detailedEvent.canTicketBePurchased != null &&
      detailedEvent.canTicketBePurchased!;

  @override
  Widget build(BuildContext context) {
    return IndentWidget(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Text(
                detailedEvent.name,
                style: customTextStyles.title,
              ),
              SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(defaultBorderRadius - 1),
                child: CachedNetworkImage(
                  imageUrl: detailedEvent.imageUrl,
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
                detailedEvent.description,
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
                      detailedEvent.startDate,
                      detailedEvent.endDate,
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
                    PriceFormatter.getFormattedPrice(detailedEvent.price),
                    style: customTextStyles.description.copyWith(
                      color: CustomColorScheme.primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              EvenueButton(
                onTap: canTicketBePurchased
                    ? () => _onBuyTicketButtonPressed(context)
                    : null,
                text: canTicketBePurchased
                    ? S.of(context).eventDetailsBuyTicketAvailableButton
                    : S.of(context).eventDetailsBuyTicketUnavailableButton,
                textSubstitute: detailedEvent.canTicketBePurchased == null
                    ? PendingWidget(customColor: Colors.white)
                    : null,
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
