import 'WebSocket.dart';

class Client {
  WebSocket _ws;
  final String _token;

  WebSocket get ws => _ws;

  Stream get events => _ws.events;
  Stream get messages => _ws.messages;

  Client(this._token) {
    _ws = WebSocket(_token);
  }

  void run() {
    _ws.connect();
  }
}
