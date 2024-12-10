import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

void main() async {
  // Configura as credenciais SMTP do Gmail
  final smtpServer = SmtpServer('smtp.gmail.com',
      username: 'pedro.rocha04@aluno.ifce.edu.br',
      password: '');

  // Cria a mensagem de e-mail
  final message = Message()
    ..from = Address('pedro.rocha04@aluno.ifce.edu.br', 'Otávio Lira')
    ..recipients.add('lucasvenicio08@gmail.com')
    ..subject = 'Atividade email em dart'
    ..text = 'Olá, este é um teste feito para fim educacional da biblioteca maielr, pedimos que apenas ignore esse email.';

  try {
    // Envia o e-mail
    await send(message, smtpServer);
    print('E-mail enviado com sucesso!');
  } on MailerException catch (e) {
    // Exibe o erro caso o envio falhe
    print('Erro ao enviar o e-mail: ${e.toString()}');
  }
}
