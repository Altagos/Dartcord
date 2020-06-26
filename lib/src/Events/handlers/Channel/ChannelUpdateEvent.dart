part of dartcord;

void channelUpdateEvent(Client client, Payload payload) {
  client.fire(ChannelUpdateEvent(client, payload));
}

class ChannelUpdateEvent extends Event {
  final Payload _payload;

  ChannelUpdateEvent(Client client, this._payload)
      : super(toCamelCase(Events.channelUpdate), client);

  Payload get payload => _payload;
}
