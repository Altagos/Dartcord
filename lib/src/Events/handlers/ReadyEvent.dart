part of dartcord;

class ReadyEvent extends Event {
  ReadyEvent() : super(toCamelCase(Events.ready));
}
