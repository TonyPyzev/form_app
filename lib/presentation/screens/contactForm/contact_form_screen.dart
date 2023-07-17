import 'package:flutter/material.dart';

import 'components/contact_form.dart';

class ContactFormScreen extends StatefulWidget {
  static const String pageRoute = '/contact-us';

  const ContactFormScreen({super.key});

  @override
  State<ContactFormScreen> createState() => _ContactFormScreenState();
}

class _ContactFormScreenState extends State<ContactFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            //TODO nav back
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 24,
          ),
        ),
        title: Text(
          'Contact us',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 32,
            right: 32,
            top: 24,
          ),
          child: ContactForm(),
        ),
      ),
    );
  }
}
