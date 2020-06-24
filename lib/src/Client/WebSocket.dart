part of dartcord;

class WebSocket {
  IOWebSocketChannel _ws;
  final Client _client;
  bool _connected = false;

  WebSocket(this._client);

  void connect() async {
    _ws = await IOWebSocketChannel.connect(GATEWAY);
    return await handle();
  }

  void handle() async {
    await _ws.stream.listen((message) async {
      //print(message);
      var payload = Payload.fromJson(message);

      switch (payload.op) {
        case OpCodes.ZERO:
          if (!_connected) {
            _connected = true;
          }
          var event = payload.t.toLowerCase();
          switch (event) {
            case Events.ready:
              _client.fire(ReadyEvent());
              break;
            case Events.messageCreate:
              _client.fire(MessageCreateEvent(Message.fromMap(payload.d)));
              break;
            default:
              _client.fire(Event(event));
          }
          break;
        case OpCodes.TEN:
          await _ws.sink.add(Payload.identify(_client.token));
          await heartbeat(payload.d['heartbeat_interval']);
          break;
        case OpCodes.ELEVEN:
          break;
        default:
          print(payload);
      }
    });
  }

  void heartbeat(int heartbeat) async {
    await Timer.periodic(Duration(milliseconds: heartbeat), (timer) {
      if (!_connected) {
        throw Exception(
            '[WebSocket] Connecting failed\n[WebSocket] Please check you bot token!');
      } else {
        _ws.sink.add(Payload.heartbeat);
      }
    });
  }
}
