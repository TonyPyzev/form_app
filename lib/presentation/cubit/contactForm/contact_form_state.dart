part of 'contact_form_cubit.dart';

enum ContactFormStatus {
  initial,
  loading,
  networkFailure,
  serverFailure,
  success,
}

class ContactFormState extends Equatable {
  final ContactFormStatus status;

  const ContactFormState({
    this.status = ContactFormStatus.initial,
  });

  @override
  List<Object> get props => [
        status,
      ];

  ContactFormState copyWith({
    ContactFormStatus? status,
  }) {
    return ContactFormState(
      status: status ?? this.status,
    );
  }
}
