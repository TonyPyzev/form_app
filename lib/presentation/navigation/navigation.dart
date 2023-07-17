import 'package:flutter/material.dart';

import '../screens/contactForm/contact_form_screen.dart';

class Navigation {
  static const String initialRoute = ContactFormScreen.pageRoute;

  static final Map<String, Widget Function(BuildContext)> routes = {
    ContactFormScreen.pageRoute: (context) => const ContactFormScreen(),
  };
}
