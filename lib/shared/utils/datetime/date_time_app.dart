import 'package:intl/intl.dart';

class DateTimeApp {
  String getDateTimeNow(int plus) {
    var now = DateTime.now().add(Duration(days: plus));
    var formatter = DateFormat('dd-MM-yyyy');
    return formatter.format(now);
  }
}
