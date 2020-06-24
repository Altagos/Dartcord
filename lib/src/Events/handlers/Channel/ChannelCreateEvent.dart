part of dartcord;

class ChannelCreateEvent extends Event {
  final Payload _payload;

  ChannelCreateEvent(this._payload) : super(toCamelCase(Events.channelCreate));

  Payload get payload => _payload;
}
