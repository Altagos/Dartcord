part of dartcord;

void channelDeleteEvent(Client client, Payload payload) {
  client.fire(ChannelDeleteEvent(client, payload));
}

class ChannelDeleteEvent extends Event {
  final Payload _payload;

  ChannelDeleteEvent(Client client, this._payload)
      : super(toCamelCase(Events.channelDelete), client);

  Payload get payload => _payload;
}
