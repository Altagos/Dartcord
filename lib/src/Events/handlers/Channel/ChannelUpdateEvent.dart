part of dartcord;

class ChannelUpdateEvent extends Event {
  final Payload _payload;

  ChannelUpdateEvent(this._payload, Client client)
      : super(toCamelCase(Events.channelUpdate), client);

  Payload get payload => _payload;
}
