
import 'package:flutter/material.dart';
import 'package:form_app/presentation/theme/app_theme.dart';

import 'navigation/navigation.dart';

class Application extends StatelessWidget {
  final String _title = 'Form app';

  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: AppTheme().appTheme,
      initialRoute: Navigation.initialRoute,
      routes: Navigation.routes,
    );
  }
}