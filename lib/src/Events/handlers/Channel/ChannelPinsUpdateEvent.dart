part of dartcord;

class ChannelPinsUpdateEvent extends Event {
  final Payload _payload;

  ChannelPinsUpdateEvent(this._payload)
      : super(toCamelCase(Events.channelPinsUpdate));

  Payload get payload => _payload;
}
