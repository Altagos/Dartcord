class Event {
  final String _eventName;
  final _eventPayload;

  Event(this._eventName, this._eventPayload);

  String get eventName => _eventName;
  dynamic get eventPayload => _eventPayload;
}
