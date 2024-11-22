import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Env {
  static final String appName = dotenv.get('APP_NAME', fallback: 'Flutter App Template');
}
