import 'package:app/enums/status_message.dart';
import 'package:app/models/message.dart';
import 'package:app/repositories/message_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'send_message_event.dart';
part 'send_message_state.dart';

class SendMessageBloc extends Bloc<SendMessageEvent, SendMessageState> {
  SendMessageBloc() : super(SendMessageInitial()) {
    on<SendMessage>(_onSendMessage);
  }
  final MessageRepository _messageRepository = MessageRepository();
  Future<void> _onSendMessage(
      SendMessage event, Emitter<SendMessageState> emit) async {
    emit(SendMessageLoading());
    try {
      var message =
          Message(content: event.message, status: StatusMessage.waiting);
      await _messageRepository.sendMessage(message);
      emit(SendMessageSuccess(message));
    } catch (e) {
      emit(SendMessageError(e.toString()));
    }
  }
}
