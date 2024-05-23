part of 'ticket_purchase/ticket_purchase.dart';

final class BankCard {
  final String cardNumber;
  final String cardExpirationDate;
  final String CVV;
  final String cardHolderName;

  const BankCard(
    this.cardNumber,
    this.cardExpirationDate,
    this.CVV,
    this.cardHolderName,
  );
}
