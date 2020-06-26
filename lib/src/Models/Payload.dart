part of dartcord;

class Payload {
  var d;
  int op;
  int s;
  String t;

  Payload({this.d, this.op, this.s, this.t});

  factory Payload.fromJson(String json) {
    var data = jsonDecode(json);
    return Payload(
      d: data['d'],
      op: data['op'],
      s: data['s'],
      t: data['t'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['op'] = op;
    data['s'] = s;
    data['t'] = t;
    data['d'] = d;
    return data;
  }

  static var heartbeat = jsonEncode({'op': 1, 'd': null});

  static dynamic identify(String token, {bool guild_subscriptions = false}) {
    var properties = {
      '\$os': 'linux',
      '\$browser': 'discord.dart',
      '\$device': 'discord.dart'
    };
    return jsonEncode({
      'op': 2,
      'd': {
        'token': token,
        'properties': properties,
        'guild_subscriptions': guild_subscriptions,
        'presence': {
          'status': StatusType.online,
          'since': 0,
          'afk': false
        }
      }
    });
  }

  static dynamic changeStatus({int since = 0, String status = 'online', bool afk = false, Game game}) {
    if (game != null) {
      return jsonEncode({
        'op': 3,
        'd': {
          'since': since,
          'game': game.toMap(),
          'status': status,
          'afk': afk
        }
      });
    } else {
      return jsonEncode({
        'op': 3,
        'd': {
          'since': since,
          'status': status,
          'afk': afk
        }
      });
    }
  }
}
