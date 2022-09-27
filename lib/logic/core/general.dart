import 'package:flutter/foundation.dart';

void printDebug(dynamic message) {
  if (kDebugMode) {
    print(message);
  }
}

DateTime fromUnixSec(int unixSec) {
  return DateTime.fromMillisecondsSinceEpoch(unixSec * 1000).toUtc();
}

int toUnixSec(DateTime dt) => (dt.millisecondsSinceEpoch / 1000).floor();
