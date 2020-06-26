part of dartcord;

class Event {
  final String _name;
  final Client _client;

  Event(this._name, this._client);

  String get name => _name;

  Client get client => _client;
}
