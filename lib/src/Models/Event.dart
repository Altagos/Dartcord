class Event {
  final String _eventName;
  final _eventPayload;
  final _eventData;

  Event(this._eventName, this._eventPayload, this._eventData);

  String get eventName => _eventName;
  dynamic get eventPayload => _eventPayload;
  dynamic get eventData => _eventData;
}
