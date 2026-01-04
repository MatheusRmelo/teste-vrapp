part of 'send_message_bloc.dart';

@immutable
abstract class SendMessageState {}

class SendMessageInitial extends SendMessageState {}

class SendMessageLoading extends SendMessageState {}

class SendMessageSuccess extends SendMessageState {
  final Message message;
  SendMessageSuccess(this.message);
}

class SendMessageError extends SendMessageState {
  final String error;
  SendMessageError(this.error);
}
