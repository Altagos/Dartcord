part of dartcord;

class GuildCreateEvent extends Event {
  GuildCreateEvent(Guild guild, Client client)
      : super(toCamelCase(Events.guildCreate), client) {
    client.guilds.set(guild.id, guild);
  }
}
