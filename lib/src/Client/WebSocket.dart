part of dartcord;

class WebSocket {
  IOWebSocketChannel _ws;
  final Client _client;
  bool _connected = false;
  final log = Logger('WebSocket');

  WebSocket(this._client);

  void connect() async {
    _ws = await IOWebSocketChannel.connect(GATEWAY);
    await handle();
  }

   Future<StreamSubscription> handle() async {
    return await _ws.stream.listen((message) async {
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
              readyEvent(_client, payload);
              break;
            // case Events.resumed:
            //   break;
            // case Events.reconnect:
            //   break;
            case Events.invalidSession:
              await _ws.sink.close();
              connect();
              break;
            case Events.channelCreate:
              channelCreateEvent(_client, payload);
              break;
            case Events.channelUpdate:
              channelUpdateEvent(_client, payload);
              break;
            case Events.channelDelete:
              channelDeleteEvent(_client, payload);
              break;
            case Events.channelPinsUpdate:
              channelPinsUpdateEvent(_client, payload);
              break;
            case Events.guildCreate:
              guildCreateEvent(_client, payload);
              break;
            // case Events.guildUpdate:
            //   break;
            // case Events.guildDelete:
            //   break;
            // case Events.guildBanAdd:
            //   break;
            // case Events.guildBanRemove:
            //   break;
            // case Events.guildEmojisUpdate:
            //   break;
            // case Events.guildInteractionsUpdate:
            //   break;
            // case Events.guildMemberAdd:
            //   break;
            // case Events.guildMemberRemove:
            //   break;
            // case Events.guildMemberUpdate:
            //   break;
            // case Events.guildMemberChunk:
            //   break;
            // case Events.guildRoleCreate:
            //   break;
            // case Events.guildRoleUpdate:
            //   break;
            // case Events.guildRoleDelete:
            //   break;
            // case Events.inviteCreate:
            //   break;
            // case Events.inviteDelete:
            //   break;
            case Events.messageCreate:
              messageCreateEvent(_client, payload);
              break;
            // case Events.messageUpdate:
            //   break;
            // case Events.messageDelete:
            //   break;
            // case Events.messageDeleteBulk:
            //   break;
            // case Events.messageReactionAdd:
            //   break;
            // case Events.messageReactionRemove:
            //   break;
            // case Events.messageReactionRemoveAll:
            //   break;
            // case Events.messageReactionRemoveEmoji:
            //   break;
            // case Events.presenceUpdate:
            //   break;
            // case Events.typingStart:
            //   break;
            // case Events.userUpdate:
            //   break;
            // case Events.voiceServerUpdate:
            //   break;
            // case Events.voiceSateUpdate:
            //   break;
            // case Events.webhooksUpdate:
            //   break;
            default:
              _client.fire(DataEvent(toCamelCase(event), _client, payload.d));
          }
          break;
        case OpCodes.SEVEN:
          await _ws.sink.close();
          _connected = false;
          return connect();
          break;
        case OpCodes.NINE:
          await _ws.sink.close();
          _connected = false;
          return connect();
          break;
        case OpCodes.TEN:
          await _ws.sink.add(Payload.identify(_client.token, guild_subscriptions: true));
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
        log.warning('WebSocket connection failed! Please check you bot token.');
        _ws.sink.close();
        timer.cancel();
        return connect();
      } else {
        _ws.sink.add(Payload.heartbeat);
      }
    });
  }

  void changeStatus({int since = 0, String status = 'online', bool afk = false, Game game}) {
    _ws.sink.add(Payload.changeStatus(
      since: since,
      status: status,
      afk: afk,
      game: game
    ));
  }
}
