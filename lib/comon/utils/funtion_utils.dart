import 'package:intl/intl.dart';

String toSentenceCase(String str) {
  return str.replaceAll('_', ' ').replaceAllMapped(RegExp(r"\w\S*"), (Match match) {
    return match[0]![0].toUpperCase() + match[0]!.substring(1).toLowerCase();
  });
}

String convertDate(String isoDate) {
  if (isoDate == '') {
    return '';
  }
  final parsedDate = DateTime.parse(isoDate);
  final DateTime dateTime = DateTime.now();
  if (dateTime.difference(parsedDate).inDays == 0) {
    return 'Today';
  } else if (dateTime.difference(parsedDate).inDays == 1) {
    return 'Yesterday';
  } else {
    return DateFormat('MM/dd/yyyy').format(parsedDate);
  }
}
