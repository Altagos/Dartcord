import 'dart:async';

import 'package:Dartcord/src/Constants/Constants.dart';
import 'package:Dartcord/src/Constants/Events.dart';
//import 'package:Dartcord/src/Constants/Events.dart';
import 'package:Dartcord/src/Models/Event.dart';
import 'package:Dartcord/src/Models/Message.dart';
import 'package:Dartcord/src/Models/Payload.dart';
import 'package:web_socket_channel/io.dart';

import '../../Dartcord.dart';

class WebSocket {
  IOWebSocketChannel _ws;
  final Client _client;
  bool _connected = false;
  final _controller = StreamController<Event>.broadcast();

  Stream<Event> get events => _controller.stream;

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
            case Events.messageCreate:
              _controller.sink
                  .add(Event(event, payload, Message.fromMap(payload.d)));
              break;
            default:
              _controller.sink.add(Event(event, payload, null));
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
