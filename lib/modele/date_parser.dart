import 'package:intl/intl.dart';

class DateParser{

  String readableDate(DateTime dateTime) {
    DateFormat dateFormat = DateFormat.yMMMMEEEEd();
    String string = dateFormat.format(dateTime);
    return string;
  }
}