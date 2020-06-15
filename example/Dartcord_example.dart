import 'package:Dartcord/Dartcord.dart';
import 'package:dotenv/dotenv.dart';

void main() {
  load();
  var awesome = Client(env['BOT_TOKEN']);

  onEvent(awesome);
  onMessage(awesome);

  awesome.run();
}

void onEvent(Client awesome) {
  awesome.ws.events.listen((Event event) {
    print('Event: ${event.eventName}');
  });
}

void onMessage(Client awesome) {
  awesome.ws.messages.listen((Message msg) {
    print('Message: ${msg.content}');
  });
}
