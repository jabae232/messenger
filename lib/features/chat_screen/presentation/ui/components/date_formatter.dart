import 'package:intl/intl.dart';

//было лень каждый кейс писать - взял с дипломного проекта где был реализован чат и была локализация на русский, английский
class DateFormatter {
  String getProperDate(DateTime dateTime, context) {
    late DateFormat formatter;
    if (DateTime.now().year > dateTime.year) {
      formatter = DateFormat('yMMMd');
    } else if (DateTime.now().month != dateTime.month) {
      formatter = DateFormat('MMMd');
    } else if (DateTime.now().month == dateTime.month) {
      if (DateTime.now().day == dateTime.day) {
        if (DateTime.now().hour == dateTime.hour) {
          if (DateTime.now().minute == dateTime.minute) {
            return "только что";
          }
          return DateTime.now().minute - dateTime.minute == 1
              ? "1 минуту назад"
              : "${(DateTime.now().minute - dateTime.minute).toString()} минут назад";
        } else {
          return DateFormat('HH:mm').format(dateTime);
        }
      } else {
        if (DateTime.now().day - dateTime.day > 7) {
          formatter = DateFormat('MMMd');
        } else if (DateTime.now().day - dateTime.day == 1) {
          return "Вчера";
        } else {
          return "${DateTime.now().day - dateTime.day} дней назад";
        }
      }
    } else if (DateTime.now().subtract(const Duration(days: 1)) ==
        dateTime.day) {
      return "Вчера";
    } else {
      formatter = DateFormat('yMMMd');
    }
    final formatedDate = formatter.format(dateTime);
    return formatedDate.toString();
  }
}
