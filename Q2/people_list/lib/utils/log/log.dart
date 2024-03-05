import 'dart:developer';

import 'package:flutter/foundation.dart';

class Log {
  Log._();

  static debug(dynamic any) {
    if (kDebugMode) {
      log(any);
    }
  }
}
