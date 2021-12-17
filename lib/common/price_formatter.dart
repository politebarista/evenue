class PriceFormatter {
  static const String _currencySymbol = "₽";

  static String getFormattedPrice(double price, {hideZeroDigits = true}) {
    final isPriceHaveZeroDigits = price % 1 == 0;
    String formattedPrice;

    formattedPrice = isPriceHaveZeroDigits && hideZeroDigits
        ? price.toInt().toString()
        : price.toString();

    return "$formattedPrice $_currencySymbol";
  }
}
