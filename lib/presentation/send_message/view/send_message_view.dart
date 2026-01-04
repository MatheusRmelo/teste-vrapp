import 'package:app/models/message.dart';
import 'package:app/presentation/send_message/bloc/send_message_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendMessageView extends StatelessWidget {
  const SendMessageView({super.key, required this.onSendMessage});
  final void Function(Message message) onSendMessage;

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();

    return BlocConsumer<SendMessageBloc, SendMessageState>(
        listener: (context, state) {
      if (state is SendMessageSuccess) {
        onSendMessage(state.message);
      }
    }, builder: (context, state) {
      return SizedBox(
        height: 300,
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: 'Digite sua mensagem',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: state is SendMessageLoading
                  ? null
                  : () {
                      context
                          .read<SendMessageBloc>()
                          .add(SendMessage(textController.text));
                    },
              child: state is SendMessageLoading
                  ? const CircularProgressIndicator()
                  : const Text('Enviar notificação'),
            ),
            if (state is SendMessageError)
              Text(
                state.error,
                style: const TextStyle(color: Colors.red),
              ),
          ],
        ),
      );
    });
  }
}
