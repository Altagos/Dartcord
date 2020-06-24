import 'package:Dartcord/Dartcord.dart';
import 'package:dotenv/dotenv.dart' show load, env;

void main() async {
  load();
  var awesome = Client(env['BOT_TOKEN']);

  awesome.on<ReadyEvent>().listen((event) {
    print('Bot is ready!');
  });

  awesome.on<MessageCreateEvent>().listen((event) {
    print('${event.message.author.username}: ${event.message.content}');
  });

  awesome.run();
}
