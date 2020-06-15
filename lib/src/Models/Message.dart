class Message {
  int _id;
  String _content;
  int _channelId;
  int _guildId;
  int _authorId; // TODO: replace with user/author
  String _authorName;

  // RestAPIHandler _rest;

  Message(this._id, this._content, this._channelId, this._guildId);

  Message.fromJson(Map<String, dynamic> json) {
    _id = int.tryParse(json['id']);
    _content = json['content'];
    _channelId = int.tryParse(json['channel_id']);
    _guildId = int.tryParse(json['guild_id']);
    _authorId = int.tryParse(json['author']['id']);
    _authorName = json['author']['username'];
  }

  int get id => _id;
  String get content => _content;
  int get channelId => _channelId;
  int get guildId => _guildId;
  int get authorId => _authorId;
  String get authorName => _authorName;

  // reply({String content}) async {
  //   var message = '<@$_authorId>, $content';
  //   await _rest.sendMessage(channelId, message);
  // }

  @override
  String toString() {
    return _content;
  }
}
