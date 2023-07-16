import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  final TextField textField;

  const InputBox({
    super.key,
    required this.textField,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 36,
          width: 36,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFFFF5E9),
          ),
          child: const Center(
            child: Icon(
              Icons.lock,
              size: 16,
              color: Color(0xFFE5BE90),
            ),
          ),
        ),
        const SizedBox(width: 32),
        Theme(
          data: ThemeData(
            inputDecorationTheme: const InputDecorationTheme(
              hintStyle: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          child: Expanded(
            child: textField,
          ),
        ),
      ],
    );
  }
}
