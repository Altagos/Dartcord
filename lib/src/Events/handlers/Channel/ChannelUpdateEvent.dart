part of dartcord;

class ChannelUpdateEvent extends Event {
  final Payload _payload;

  ChannelUpdateEvent(this._payload) : super(toCamelCase(Events.channelUpdate));

  Payload get payload => _payload;
}
