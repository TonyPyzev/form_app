import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../core/failures/failure.dart';
import '../../core/failures/network_failure.dart';
import '../../core/failures/server_failure.dart';
import '../../core/success/response_success.dart';
import '../../core/success/success.dart';
import '../entities/contact_form_data.dart';

abstract class SendContactForm {
  Future<(Failure?, Success?)> execute(ContactFormData formData);
}

class SendContactFormImpl implements SendContactForm {
  final String uri = 'https://api.byteplex.info/api/test/contact/';
  final Dio dio = Dio();

  @override
  Future<(Failure?, Success?)> execute(ContactFormData formData) async {
    final bool isConnected = await InternetConnectionChecker().hasConnection;

    if (!isConnected) {
      return (NetworkFailure(), null);
    }

    final responce = await dio.post(uri, data: formData.toJson());

    if (responce.statusCode != 201) {
      return (ServerFailure(), null);
    }

    return (null, ResponseSuccess());
  }
}
