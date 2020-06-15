import 'package:Dartcord/Dartcord.dart';

void onMessage(Client awesome, Message msg) async {
  print('Message: ${msg.authorName} - ${msg.content}');
}
