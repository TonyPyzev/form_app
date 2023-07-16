import 'package:flutter/material.dart';

import 'components/input_box.dart';

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
          onTap: () {},
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 32,
            right: 32,
            top: 24,
          ),
          child: Column(
            children: [
              const InputBox(
                textField: TextField(
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    hintText: 'Name',
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const InputBox(
                textField: TextField(
                  textCapitalization: TextCapitalization.none,
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const InputBox(
                textField: TextField(
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    hintText: 'Message',
                  ),
                ),
              ),
              const SizedBox(height: 64),
              SizedBox.fromSize(
                size: const Size(
                  double.infinity,
                  48,
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF942179),
                    disabledBackgroundColor: const Color(0xFF986D8E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    'Send',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
