part of dartcord;

class Client extends EventHandler {
  WebSocket _ws;
  Rest _rest;
  final String _token;
  Map _guilds = <int, Guild>{};
  bool _cacheGuilds;
  ClientUser _user;

  WebSocket get ws => _ws;

  Rest get rest => _rest;

  String get token => _token;

  Map<int, Guild> get guilds => _guilds;

  bool get cacheGuilds => _cacheGuilds;

  ClientUser get user => _user;

  set user(ClientUser user) => _user = user;

  set guilds(Map<int, Guild> guilds) => _guilds = guilds;

  Client(this._token, {bool cacheGuilds = true}) {
    _cacheGuilds = cacheGuilds;
    _ws = WebSocket(this);
    _rest = Rest(this);
  }

  void run() {
    _ws.connect();
  }

  void changeStatus({int since = 0, String status = 'online', bool afk = false, Game game}) {
    _ws.changeStatus(
      since: since,
      status: status,
      afk: afk,
      game: game
    );
  }
}
