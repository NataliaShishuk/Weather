import 'package:intl/intl.dart';

class Formater {
  static String formatTemperature(double temperature) =>
      _roundTemperature(temperature).toString();

  static String formatTemperatureWithUnits(double temperature) =>
      '${formatTemperature(temperature)}°';

  static String formatDateToMonthWeekday(DateTime dateTime) =>
      DateFormat(DateFormat.ABBR_MONTH_WEEKDAY_DAY).format(dateTime).toString();

  static String formatDateToHoursMinute(DateTime dateTime) =>
      DateFormat(DateFormat.HOUR24_MINUTE).format(dateTime).toString();

  static int _roundTemperature(double temperature) => temperature.round();
}
