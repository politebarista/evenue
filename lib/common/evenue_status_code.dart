class EvenueStatusCode {
  // GENERAL ERRORS - 600
  static String get incorrectPassword => "601";

  // CUSTOMER ERRORS - 610
  static String get customerDontExist => "611";
  static String get customerAlreadyExist => "612";
  static String get errorWhileCreatingCustomer => "613";

  // ORGANIZER ERRORS - 620
  static String get organizerDontExist => "621";

  // TICKET ERROR CODES - 630
  static String get noAwaitingPaymentTicket => "631";
  static String get incorrectConfirmationPurchaseCode => "632";
  static String get noTicketsLeftForEvent => "633";
  static String get incorrectPaymentCardInformation => "634";
  static String get incorrectEventInformation => "635";
  static String get incorrectCustomerInformation => "636";
}