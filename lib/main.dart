import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app_bindings.dart';
import 'core/constants/app_theme.dart';
import 'core/routing/routing.dart';
import 'core/constants/env.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: Env.appName,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      getPages: Routing.pages,
      initialBinding: AppBindings(),
    );
  }
}
