import 'package:Dartcord/Dartcord.dart';
import 'package:dotenv/dotenv.dart';

void main() async {
  load();
  var awesome = Client(env['BOT_TOKEN']);

  onEvent(awesome);
  onMessage(awesome);

  awesome.run();
}

void onEvent(Client awesome) async {
  await for (Event event in awesome.events) {
    print('Event: ${event.eventName}');
  }
}

void onMessage(Client awesome) async {
  await for (Message msg in awesome.messages) {
    print('Message: ${msg.authorName} - ${msg.content}');
  }
}
