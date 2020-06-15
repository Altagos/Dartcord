import 'package:Dartcord/src/Constants/Events.dart';

import '../../Dartcord.dart';
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

  void eventHandlers({onEvent, onReady, onMessage}) async {
    await for (Event event in _ws.events) {
      switch (event.eventName) {
        case Events.ready:
          ready(this, event.eventPayload);
          onReady(this, event.eventPayload);
          break;
        case Events.messageCreate:
          onMessage(this, event.eventData);
          break;
        default:
          onEvent(this, event);
      }
    }
  }
}
