import 'dart:async';
import 'dart:io';

import 'package:Dartcord/src/Constants/Constants.dart';
import 'package:Dartcord/src/Models/Event.dart';
import 'package:Dartcord/src/Models/Payload.dart';
import 'package:web_socket_channel/io.dart';

class WebSocket {
  IOWebSocketChannel _ws;
  final String _token;
  bool _connected = false;
  final _controller = StreamController<Event>.broadcast();

  Stream<Event> get events => _controller.stream;

  WebSocket(this._token);

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
          _controller.sink.add(Event(payload.t.toLowerCase(), payload));
          break;
        case OpCodes.TEN:
          await _ws.sink.add(Payload.identify(_token));
          await heartbeat(payload.d['heartbeat_interval']);
          break;
        case OpCodes.ELEVEN:
          break;
      }
    });
  }

  void heartbeat(int heartbeat) async {
    await Timer.periodic(Duration(milliseconds: heartbeat), (timer) {
      if (!_connected) {
        print(
            '[WebSocket] Connecting failed\n[WebSocket] Please check you bot token!');
        _ws.sink.close();
        exit(500);
      } else {
        _ws.sink.add(Payload.heartbeat);
      }
    });
  }
}
