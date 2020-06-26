part of dartcord;

class ChannelPinsUpdateEvent extends Event {
  final Payload _payload;

  ChannelPinsUpdateEvent(this._payload, Client client)
      : super(toCamelCase(Events.channelPinsUpdate), client);

  Payload get payload => _payload;
}
