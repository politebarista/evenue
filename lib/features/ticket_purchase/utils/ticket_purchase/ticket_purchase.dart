part '../bank_card.dart';

abstract interface class TicketPurchase {
  Future<bool> checkPurchaseOption(String eventId);

  Future<String> bookTicketAndGetPaymentId(
    BankCard bankCard,
    String eventId,
    String customerEmail,
  );

  Future<void> confirmPurchase(String paymentId, String confirmationCode);
}
