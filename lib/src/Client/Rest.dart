part of dartcord;

class Rest {
  final Client _client;
  String _token;

  Rest(this._client) {
    _token = _client.token;
  }

  // Guild Stuff
  Future fetchGuilds() async {
    var response = await http.get('$API/${Endpoints.USER_GUILDS}',
        headers: getHeader(_token));
    return jsonDecode(response.body);
  }

  Future fetchGuild(int id) async {
    var response = await http.get('$API/${Endpoints.GUILDS}/$id',
        headers: getHeader(_token));
    return jsonDecode(response.body);
  }

  Future fetchGuildRoles(int id) async {
    var response = await http.get('$API/${Endpoints.GUILDS}/$id/roles',
        headers: getHeader(_token));
    return jsonDecode(response.body);
  }

  Future<Map<int, Channel>> fetchGuildChannels(int id) async {
    var channels = <int, Channel>{};
    var response = await http.get('$API/${Endpoints.GUILDS}/$id/channels',
        headers: getHeader(_token));
    for (var channel in jsonDecode(response.body)) {
      print(channel['type']);
      if (channel['type'] != 4 ||
          channel['type'] != 1 ||
          channel['type'] != 3) {
        channels[int.tryParse(channel['id'])] = Channel.fromMap(channel);
      }
    }
    return channels;
  }

  // Send Message
  Future sendMessage(int channelId,
      {String content, bool tts = false, Embed embed}) async {
    var response = await http.post(
        '$API/${Endpoints.CHANNELS}/$channelId/messages',
        headers: getHeader(_token),
        body: jsonEncode(
            {'content': content, 'tts': tts, 'embed': embed.embed()}));
    return Message.fromJson(response.body, _client);
  }

  Map<String, String> getHeader(String token) {
    return {'Content-Type': 'application/json', 'Authorization': 'Bot $token'};
  }
}
