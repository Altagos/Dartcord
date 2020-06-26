import 'dart:math';

import 'package:Dartcord/Dartcord.dart';
import 'package:dotenv/dotenv.dart' show load, env;

void main() async {
  load();
  var awesome = Client(env['BOT_TOKEN']);

  //awesome.on().listen((event) => print('${event.name}Event was fired'));

  awesome.on<ReadyEvent>().listen((_) {
    print('Bot is ready!');
    print('Bot Id: ${awesome.user.id}');
    print('Guilds (${awesome.guilds}):');
//    print((2146958847 & 0x008) == 0x008);
  });

  awesome.on<MessageCreateEvent>().listen((MessageCreateEvent event) async {
    if (event.message.author.id == awesome.user.id) {
      return;
    }
    if (event.message.content == '!ping') {
      var random = Random();
      var embed = Embed()
        ..title = 'Pong!'
        ..color = Color.rgb(
            random.nextInt(255), random.nextInt(255), random.nextInt(255))
        ..addField(name: 'token', value: awesome.token);
      await event.message.reply(embed: embed);
    }
  });

  awesome.run();
}
