part of dartcord;

void guildCreateEvent(Client client, Payload payload) {
  var guild = Guild.fromJson(payload.d);
  client.guilds[guild.id] = guild;
  client.fire(GuildCreateEvent(client, guild));
}

class GuildCreateEvent extends Event {
  GuildCreateEvent(Client client, Guild guild)
      : super(toCamelCase(Events.guildCreate), client);
}
