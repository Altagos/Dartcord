import 'package:Dartcord/Dartcord.dart';
import 'package:dotenv/dotenv.dart' show load, env;

import 'events/onEvent.dart';
import 'events/onMessage.dart';
import 'events/onReady.dart';

void main() async {
  load();
  var awesome = Client(env['BOT_TOKEN']);
  awesome.eventHandlers(
      onReady: onReady, onMessage: onMessage, onEvent: onEvent);

  awesome.run();
}
