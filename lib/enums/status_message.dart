enum StatusMessage {
  success,
  waiting,
  error;

  String get name => switch (this) {
        success => 'SUCESSO',
        waiting => 'AGUARDANDO PROCESSAMENTO',
        error => 'FALHA NO PROCESSAMENTO',
      };
}
