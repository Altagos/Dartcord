import 'package:Dartcord/Dartcord.dart';
import 'package:dotenv/dotenv.dart';

void main() {
  load();
  var awesome = Client(env['BOT_TOKEN']);
  awesome.ws.events.listen((event) {
    print('Event: ${event.eventName}');
  });
  awesome.run();
}
