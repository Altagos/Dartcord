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
              _client.fire(ChannelCreateEvent(payload, _client));
              break;
            case Events.channelUpdate:
              _client.fire(ChannelUpdateEvent(payload, _client));
              break;
            case Events.channelDelete:
              _client.fire(ChannelDeleteEvent(payload, _client));
              break;
            case Events.channelPinsUpdate:
              _client.fire(ChannelPinsUpdateEvent(payload, _client));
              break;
            case Events.guildCreate:
              _client
                  .fire(GuildCreateEvent(Guild.fromJson(payload.d), _client));
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
              _client.fire(MessageCreateEvent(
                  _client, Message.fromMap(payload.d, _client)));
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
          connect();
          break;
        case OpCodes.NINE:
          await _ws.sink.close();
          _connected = false;
          connect();
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
