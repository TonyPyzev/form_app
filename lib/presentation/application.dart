import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/contactForm/contact_form_cubit.dart';
import 'navigation/navigation.dart';
import 'theme/app_theme.dart';

class Application extends StatelessWidget {
  final String _title = 'Form app';

  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ContactFormCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: _title,
        theme: AppTheme().appTheme,
        initialRoute: Navigation.initialRoute,
        routes: Navigation.routes,
      ),
    );
  }
}
