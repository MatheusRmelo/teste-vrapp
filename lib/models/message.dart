import 'package:app/enums/status_message.dart';
import 'package:uuid/uuid.dart';

class Message {
  final String id;
  final String content;
  final StatusMessage status;

  Message({
    String? id,
    required this.content,
    required this.status,
  }) : id = id ?? const Uuid().v4();

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json['id'],
        content: json['content'],
        status: StatusMessage.values.byName(json['status']),
      );

  Map<String, dynamic> toJson() => {
        'mensagemId': id,
        'conteudoMensagem': content,
      };
}
