part of dartcord;

class ChannelCreateEvent extends Event {
  final Payload _payload;

  ChannelCreateEvent(this._payload, Client client)
      : super(toCamelCase(Events.channelCreate), client);

  Payload get payload => _payload;
}
