import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/contact_form_data.dart';
import '../../../cubit/contactForm/contact_form_cubit.dart';
import '../../../utilities/contact_form_validator.dart';
import 'input_box.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({
    super.key,
  });

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _messageController;

  bool? isValidName;
  bool? isValidEmail;
  bool? isValidMessgae;

  @override
  void initState() {
    _initControllers();
    super.initState();
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ContactFormCubit, ContactFormState>(
      listener: (context, state) {
        switch (state.status) {
          case ContactFormStatus.networkFailure:
            _showSnackBar(
              context,
              message: 'Network error. Check network connection.',
            );
            break;
          case ContactFormStatus.serverFailure:
            _showSnackBar(
              context,
              message: 'Oops... something went wrong...',
            );
            break;
          case ContactFormStatus.success:
            _showSnackBar(
              context,
              message: 'Message sended!',
            );
            _clearFields();
            break;
          default:
            break;
        }
      },
      child: BlocBuilder<ContactFormCubit, ContactFormState>(
        builder: (context, state) {
          return Column(
            children: [
              Focus(
                onFocusChange: (hasFocus) {
                  if (!hasFocus) {
                    setState(() {
                      isValidName = ContactFormValidator.isValidName(
                        _nameController.text,
                      );
                    });
                  }
                },
                child: InputBox(
                  textField: TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r"[a-zA-Z]+|\s"),
                      ),
                    ],
                    controller: _nameController,
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: 'Name',
                      errorText: isValidName != null
                          ? isValidName!
                              ? null
                              : 'Name is required'
                          : null,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Focus(
                onFocusChange: (hasFocus) {
                  if (!hasFocus) {
                    setState(() {
                      isValidEmail = ContactFormValidator.isValidEmail(
                        _emailController.text,
                      );
                    });
                  }
                },
                child: InputBox(
                  textField: TextField(
                    controller: _emailController,
                    textCapitalization: TextCapitalization.none,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      errorText: isValidEmail != null
                          ? isValidEmail!
                              ? null
                              : 'Email is required'
                          : null,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Focus(
                onFocusChange: (hasFocus) {
                  if (!hasFocus) {
                    setState(() {
                      isValidMessgae = ContactFormValidator.isValidMessgae(
                        _messageController.text,
                      );
                    });
                  }
                },
                child: InputBox(
                  textField: TextField(
                    controller: _messageController,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      hintText: 'Message',
                      errorText: isValidMessgae != null
                          ? isValidMessgae!
                              ? null
                              : 'Message is required'
                          : null,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 64),
              if (state.status == ContactFormStatus.loading)
                const CircularProgressIndicator(
                  color: Color(0xFF942179),
                ),
              if (state.status != ContactFormStatus.loading)
                SizedBox.fromSize(
                  size: const Size(
                    double.infinity,
                    48,
                  ),
                  child: ElevatedButton(
                    onPressed: sendForm(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF942179),
                      disabledBackgroundColor: const Color(0xFF986D8E),
                      disabledForegroundColor: Colors.white,
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
                ),
            ],
          );
        },
      ),
    );
  }

  VoidCallback? sendForm() {
    if (isValidName == true && isValidEmail == true && isValidMessgae == true) {
      return () {
        context.read<ContactFormCubit>().sendForm(
              ContactFormData(
                _nameController.text.trim(),
                _emailController.text.trim(),
                _messageController.text.trim(),
              ),
            );
      };
    }
    return null;
  }

  void _showSnackBar(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            message,
          ),
        ),
      ),
    );
  }

  void _clearFields() {
    _nameController.clear();
    _emailController.clear();
    _messageController.clear();

    isValidName = null;
    isValidEmail = null;
    isValidMessgae = null;
  }

  void _initControllers() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _messageController = TextEditingController();
  }

  void _disposeControllers() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
  }
}
