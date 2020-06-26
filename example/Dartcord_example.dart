import 'dart:math';

import 'package:Dartcord/Dartcord.dart';
import 'package:dotenv/dotenv.dart' show load, env;
import 'package:logging/logging.dart';

void main() async {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

  load();

  var awesome = Client(env['BOT_TOKEN']);

  awesome.on<ReadyEvent>().listen((_) {
    awesome.changeStatus(
      status: StatusType.idle,
      afk: true,
      game: Game('Testing the bot library', GameType.Game)
    );

    print('Bot is ready!');
    print('Bot Id: ${awesome.user.id}');
    print('Guild (${awesome.guilds.length}):');
    awesome.guilds.forEach((id, guild) {
      print('- ${guild.name} (ID: $id, Roles: ${guild.roles.length}, Custom Emojis: ${guild.emojis.length})');
    });
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
            random.nextInt(255), random.nextInt(255), random.nextInt(255));
      await event.message.reply(embed: embed);
    }
  });

  awesome.run();
}
