import 'package:logger/logger.dart';

final Logger logger = Logger();

void logDebug({
  required dynamic msg,
}) {
  logger.d(msg);
}

void logInfo({
  required dynamic msg,
}) {
  logger.i(msg);
}

void logError({
  required dynamic msg,
}) {
  logger.e(msg);
}
