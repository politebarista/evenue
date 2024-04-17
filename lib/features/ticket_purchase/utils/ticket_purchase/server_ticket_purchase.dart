import 'dart:convert';

import 'package:evenue/common/definition/app_definition.dart';
import 'package:evenue/features/ticket_purchase/utils/ticket_purchase_error_mapper.dart';
import 'package:http/http.dart' as http;

import 'ticket_purchase.dart';

final class ServerTicketPurchase implements TicketPurchase {
  final AppDefinition _appDef;

  ServerTicketPurchase(AppDefinition appDefinition) : _appDef = appDefinition;

  Future<bool> checkPurchaseOption(final String eventId) async {
    final requestBody = jsonEncode(<String, dynamic>{
      'eventId': eventId,
    });

    final response = await http.post(
      Uri.parse(_appDef.baseUrl + 'ticket/checkPurchaseOption'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: requestBody,
    );

    final bool decodedResponseBody = jsonDecode(response.body);

    return decodedResponseBody;
  }

  Future<String> bookTicketAndGetPaymentId(
    BankCard bankCard,
    String eventId,
    String customerEmail,
  ) async {
    final requestBody = jsonEncode(<String, dynamic>{
      'cardNumber': bankCard.cardNumber,
      'cardExpirationDate': bankCard.cardExpirationDate,
      'CVV': bankCard.CVV,
      'cardHolderName': bankCard.cardHolderName,
      'eventId': eventId,
      'customerEmail': customerEmail,
    });

    final response = await http.post(
      Uri.parse(_appDef.baseUrl + 'ticket/sendPurchaseConfirmationCodeAndGetPaymentId'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: requestBody,
    );
    final body = response.body;

    final error = TicketPurchaseErrorMapper.getErrorFromCode(body);
    if (error != null) {
      throw error;
    }

    return body;
  }

  @override
  Future<bool> confirmPurchase(String paymentId, String confirmationCode) {
    // TODO: implement confirmPurchase
    throw UnimplementedError();
  }
}