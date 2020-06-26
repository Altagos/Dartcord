part of dartcord;

void readyEvent(Client client, Payload payload) async {
  client.user = ClientUser.fromJson(payload.d['user']);

  var guilds = await client.rest.fetchGuilds();
  for (var guild in guilds) {
    client.guilds[int.tryParse(guild['id'])] = Guild.fromJson(guild);
  }

  if (client.cacheGuilds) {
    for (var guild in payload.d['guilds']) {
      var newGuild = Guild.fromJson(
          await client.rest.fetchGuild(int.tryParse(guild['id'])));
      client.guilds[newGuild.id] = newGuild;
    }
  }

  client.fire(ReadyEvent(client));
}

class ReadyEvent extends Event {
  ReadyEvent(Client client) : super(toCamelCase(Events.ready), client);
}
