sealed class TicketPurchaseError extends Error {}

final class NoAwaitingPaymentTicketError extends TicketPurchaseError {}

final class IncorrectConfirmationPurchaseCodeError extends TicketPurchaseError {}

final class NoTicketsLeftForEventError extends TicketPurchaseError {}

final class IncorrectPaymentCardInformationError extends TicketPurchaseError {}

final class IncorrectEventInformationError extends TicketPurchaseError {}

final class IncorrectCustomerInformationError extends TicketPurchaseError {}

final class TicketPurchaseUnknownError extends TicketPurchaseError {}
