
import 'package:intl/intl.dart';

String getActualNameDay(){
  String day = DateFormat.EEEE().format(DateTime.now());
  return day;
}

String getActualDate(){
  String date = DateFormat('EEE, MMM d').format(DateTime.now());
  return date;
}
