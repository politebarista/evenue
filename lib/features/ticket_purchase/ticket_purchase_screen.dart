import 'package:evenue/common/config.dart';
import 'package:evenue/features/ticket_purchase/entering_purchase_data/entering_purchase_data_screen.dart';
import 'package:evenue/features/ticket_purchase/utils/ticket_purchase/server_ticket_purchase.dart';
import 'package:evenue/features/ticket_purchase/utils/ticket_purchase/ticket_purchase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TicketPurchaseScreen extends StatefulWidget {
  final String eventId;
  final String eventName;

  const TicketPurchaseScreen({
    required this.eventId,
    required this.eventName,
    super.key,
  });

  @override
  State<TicketPurchaseScreen> createState() => _TicketPurchaseScreenState();
}

class _TicketPurchaseScreenState extends State<TicketPurchaseScreen> {
  late final GlobalKey<NavigatorState> navigatorKey;

  @override
  void initState() {
    super.initState();
    navigatorKey = GlobalKey<NavigatorState>();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<TicketPurchase>(
      create: (context) => ServerTicketPurchase(context.read<Config>().appDef),
      child: PopScope(
        canPop: false,
        // ignore: prefer-extracting-callbacks
        onPopInvoked: (didPop) {
          if (didPop) return;

          if (navigatorKey.currentState!.canPop()) {
            navigatorKey.currentState!.pop();
          } else {
            Navigator.of(context).pop();
          }
        },
        child: Navigator(
          key: navigatorKey,
          onGenerateRoute: (_) {
            return MaterialPageRoute(
              builder: (_) => EnteringPurchaseDataScreen(widget.eventId, widget.eventName),
            );
          },
        ),
      ),
    );
  }
}
