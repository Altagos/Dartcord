part of dartcord;

class Message {
  final int _id;
  final int _channelId;
  final int _guildId;
  final User _author;
  final _member;
  final String _content;
  final DateTime _timestamp;
  final DateTime _editedTimestamp;
  final bool _tts;
  final bool _mentionEveryone;
  final List<User> _mentions;
  final List<int> _mentionRoles;
  final _attachments;
  final _embeds;
  final _reactions;
  final _nonce;
  final bool _pinned;
  final int _webhookId;
  final int _type;
  final int _flags;

  final Client _client;

  int get id => _id;

  int get channelId => _channelId;

  int get guildId => _guildId;

  User get author => _author;

  dynamic get member => _member;

  String get content => _content;

  DateTime get timestamp => _timestamp;

  DateTime get editedTimestamp => _editedTimestamp;

  bool get tts => _tts;

  bool get mentionEveryone => _mentionEveryone;

  List get mentions => _mentions;

  List get mentionRoles => _mentionRoles;

  dynamic get attachments => _attachments;

  dynamic get embeds => _embeds;

  dynamic get reactions => _reactions;

  dynamic get nonce => _nonce;

  bool get pinned => _pinned;

  int get webhookId => _webhookId;

  int get type => _type;

  int get flags => _flags;

  Message(
      this._id,
      this._channelId,
      this._guildId,
      this._author,
      this._member,
      this._content,
      this._timestamp,
      this._editedTimestamp,
      this._tts,
      this._mentionEveryone,
      this._mentions,
      this._mentionRoles,
      this._attachments,
      this._embeds,
      this._reactions,
      this._nonce,
      this._pinned,
      this._webhookId,
      this._type,
      this._flags,
      this._client);

  Future reply({String content, Embed embed, bool tts = false}) async {
    return await _client.rest
        .sendMessage(_channelId, content: content, embed: embed, tts: tts);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'channel_id': _channelId,
      'guild_id': _guildId,
      'author': _author?.toMap(),
      'member': _member?.toMap(),
      'content': _content,
      'timestamp': _timestamp?.millisecondsSinceEpoch,
      'edited_timestamp': _editedTimestamp?.millisecondsSinceEpoch,
      'tts': _tts,
      'mention_everyone': _mentionEveryone,
      'mentions': _mentions?.map((x) => x?.toMap())?.toList(),
      'mention_roles': _mentionRoles,
      'attachments': _attachments?.toMap(),
      'embeds': _embeds?.toMap(),
      'reactions': _reactions?.toMap(),
      'nonce': _nonce?.toMap(),
      'pinned': _pinned,
      'webhook_id': _webhookId,
      'type': _type,
      'flags': _flags,
    };
  }

  static Message fromMap(Map<String, dynamic> map, Client client) {
    if (map == null) return null;

    return Message(
        int.tryParse(map['id']),
        int.tryParse(map['channel_id']),
        map['guild_id'] != null ? int.tryParse(map['guild_id']) : null,
        User.fromMap(map['author']),
        map['member'],
        map['content'],
        DateTime.parse(map['timestamp']),
        map['edited_timestamp'] != null
            ? DateTime.parse(map['edited_timestamp'])
            : null,
        map['tts'],
        map['mention_everyone'],
        List<User>.from(map['mentions']?.map((x) => User.fromMap(x))),
        List<int>.from(map['mention_roles']),
        map['attachments'],
        map['embeds'],
        map['reactions'],
        map['nonce'],
        map['pinned'],
        map['webhookId'] != null ? int.tryParse(map['webhookId']) : null,
        map['type'],
        map['flags'],
        client);
  }

  String toJson() => json.encode(toMap());

  static Message fromJson(String source, Client client) =>
      fromMap(json.decode(source), client);
}
