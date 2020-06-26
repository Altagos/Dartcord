part of dartcord;

class DataEvent extends Event {
  final dynamic _data;

  DataEvent(String name, Client client, this._data) : super(name, client);

  dynamic get data => _data;
}
