part of dartcord;

void channelPinsUpdateEvent(Client client, Payload payload) {
  client.fire(ChannelPinsUpdateEvent(client, payload));
}

class ChannelPinsUpdateEvent extends Event {
  final Payload _payload;

  ChannelPinsUpdateEvent(Client client, this._payload)
      : super(toCamelCase(Events.channelPinsUpdate), client);

  Payload get payload => _payload;
}
