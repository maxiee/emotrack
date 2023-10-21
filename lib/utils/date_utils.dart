import 'package:intl/intl.dart';

final _chineseDateFormat = DateFormat('y年M月d日');  // 定义日期时间格式
final _timeFormat = DateFormat('HH:mm');

String toChineseDateStr(DateTime dateTime) {
  return _chineseDateFormat.format(dateTime);
}

String toTimeStr(DateTime dateTime) {
  return _timeFormat.format(dateTime);
}
