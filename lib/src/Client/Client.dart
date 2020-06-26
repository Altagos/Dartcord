part of dartcord;

class Client extends EventHandler {
  WebSocket _ws;
  Rest _rest;
  final String _token;
  MapCache _guilds = MapCache<int, Guild>();
  bool _cacheGuilds;
  ClientUser _user;

  WebSocket get ws => _ws;

  Rest get rest => _rest;

  String get token => _token;

  MapCache get guilds => _guilds;

  bool get cacheGuilds => _cacheGuilds;

  ClientUser get user => _user;

  set user(ClientUser user) => _user = user;

  set guilds(MapCache guilds) => _guilds = guilds;

  Client(this._token, {bool cacheGuilds = true}) {
    _cacheGuilds = cacheGuilds;
    _ws = WebSocket(this);
    _rest = Rest(this);
  }

  void run() {
    _ws.connect();
  }
}
