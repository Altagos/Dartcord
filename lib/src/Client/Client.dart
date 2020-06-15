import 'WebSocket.dart';

class Client {
  WebSocket _ws;
  String _token;

  WebSocket get ws => _ws;

  Client(this._token) {
    _ws = WebSocket(_token);
  }

  void run() {
    _ws.connect();
  }
}
