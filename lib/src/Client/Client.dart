part of dartcord;

class Client extends EventHandler {
  WebSocket _ws;
  final String _token;

  WebSocket get ws => _ws;
  String get token => _token;

  Client(this._token) {
    _ws = WebSocket(this);
  }

  void run() {
    _ws.connect();
  }

  // void eventHandlers({onEvent, onReady, onMessage}) async {
  //   await for (Event event in _ws.events) {
  //     switch (event.eventName) {
  //       case Events.ready:
  //         ready(this, event.eventPayload);
  //         onReady(this, event.eventPayload);
  //         break;
  //       case Events.messageCreate:
  //         onMessage(this, event.eventData);
  //         break;
  //       default:
  //         onEvent(this, event);
  //     }
  //   }
  // }
}
