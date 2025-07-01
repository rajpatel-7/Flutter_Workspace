import 'package:intl/intl.dart';

void main() {
  DateTime now = DateTime.now();

  // Date formatting
  var dateFormatter = DateFormat.yMMMMEEEEd('en_US');
  print("Formatted Date (US): ${dateFormatter.format(now)}");

  var dateFormatterHindi = DateFormat.yMMMMEEEEd('hi_IN');
  print("Formatted Date (Hindi): ${dateFormatterHindi.format(now)}");

  // Number formatting
  var number = 1234567.89;
  var usFormat = NumberFormat.currency(locale: 'en_US', symbol: '\$');
  var inFormat = NumberFormat.currency(locale: 'hi_IN', symbol: '₹');

  print("Number (US): ${usFormat.format(number)}");
  print("Number (India): ${inFormat.format(number)}");
}
