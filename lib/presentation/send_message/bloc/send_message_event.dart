part of 'send_message_bloc.dart';

@immutable
abstract class SendMessageEvent {}

class SendMessage extends SendMessageEvent {
  final String message;
  SendMessage(this.message);
}
