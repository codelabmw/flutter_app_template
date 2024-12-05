import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

abstract class LicenseManager {
  static void register() {
    // Poppins font license
    LicenseRegistry.addLicense(() async* {
      final license = await rootBundle.loadString('fonts/Poppins/OFL.txt');
      yield LicenseEntryWithLineBreaks(['google_fonts'], license);
    });
  }
}
