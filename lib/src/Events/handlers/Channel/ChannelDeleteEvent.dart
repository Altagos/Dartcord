part of dartcord;

class ChannelDeleteEvent extends Event {
  final Payload _payload;

  ChannelDeleteEvent(this._payload, Client client)
      : super(toCamelCase(Events.channelDelete), client);

  Payload get payload => _payload;
}
