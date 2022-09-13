import 'package:intl/intl.dart';

class WeatherHelper {
  static String getCurrentUnits() => '°';

  static String getTemperatureFormat(double temperature) =>
      '${_roundTemperature(temperature)}${getCurrentUnits()}';

  static String getMonthWeekdayDateFormat(DateTime dateTime) =>
      DateFormat(DateFormat.ABBR_MONTH_WEEKDAY_DAY).format(dateTime).toString();

  static String getHoursMinuteDateFormat(DateTime dateTime) =>
      DateFormat(DateFormat.HOUR24_MINUTE).format(dateTime).toString();

  static int _roundTemperature(double temperature) => temperature.round();
}
