import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/failures/failure.dart';
import '../../../core/failures/network_failure.dart';
import '../../../core/failures/server_failure.dart';
import '../../../core/success/response_success.dart';
import '../../../core/success/success.dart';
import '../../../domain/usecases/send_contact_form.dart';

import '../../../domain/entities/contact_form_data.dart';

part 'contact_form_state.dart';

class ContactFormCubit extends Cubit<ContactFormState> {
  ContactFormCubit() : super(const ContactFormState());

  Future<void> sendForm(ContactFormData formData) async {
    emit(state.copyWith(
      status: ContactFormStatus.loading,
    ));

    final (failure, success) = await SendContactFormImpl().execute(formData);

    _processResponse(failure, success);
  }

  void _processResponse(Failure? failure, Success? success) {
    if (failure != null) {
      if (failure is NetworkFailure) {
        emit(state.copyWith(
          status: ContactFormStatus.networkFailure,
        ));
      }
      if (failure is ServerFailure) {
        emit(state.copyWith(
          status: ContactFormStatus.serverFailure,
        ));
      }
    }
    if (success != null) {
      if (success is ResponseSuccess) {
        emit(state.copyWith(
          status: ContactFormStatus.success,
        ));
      }
    }
  }
}
