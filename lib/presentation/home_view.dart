import 'package:app/models/message.dart';
import 'package:app/presentation/send_message/bloc/send_message_bloc.dart';
import 'package:app/presentation/send_message/view/send_message_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Message> _messages = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mensageria'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('Home'),
            BlocProvider(
                create: (context) => SendMessageBloc(),
                child: SendMessageView(
                  onSendMessage: (message) {
                    setState(() {
                      _messages.add(message);
                    });
                  },
                )),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Column(
                      children: [
                        Row(
                          children: [
                            const Text('MensagemID: '),
                            Expanded(child: Text(_messages[index].id)),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Conteudo: '),
                            Text(_messages[index].content),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Status: '),
                            Text(_messages[index].status.name),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: _messages.length,
            )),
          ],
        ),
      ),
    );
  }
}
