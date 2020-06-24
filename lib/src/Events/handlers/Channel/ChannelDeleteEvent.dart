part of dartcord;

class ChannelDeleteEvent extends Event {
  final Payload _payload;

  ChannelDeleteEvent(this._payload) : super(toCamelCase(Events.channelDelete));

  Payload get payload => _payload;
}
