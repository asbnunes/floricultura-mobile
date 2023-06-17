import 'package:intl/intl.dart';

class FormatadorPreco {
  static String formatPrice(double price) {
    return NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
      decimalDigits: 2,
    ).format(price);
  }
}