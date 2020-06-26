part of dartcord;

class Channel {
  final int _id;
  final int _type;
  final int _guildId;
  final int _position;
  final List<Overwrite> _permissionOverwrites;
  final String _name;
  final String _topic;
  final bool _nsfw;
  final int _lastMessageId;
  final int _bitrate;
  final int _userLimit;
  final int _rateLimitPerUser;
  final List<User> _recipients;
  final String _icon;
  final int _ownerId;
  final int _applicationId;
  final int _parentId;
  final DateTime _lastPinTimestamp;

  int get id => _id;

  int get type => _type;

  int get guildId => _guildId;

  int get position => _position;

  List get permissionOverwrites => _permissionOverwrites;

  String get name => _name;

  String get topic => _topic;

  bool get nsfw => _nsfw;

  int get lastMessageId => _lastMessageId;

  int get bitrate => _bitrate;

  int get userLimit => _userLimit;

  int get rateLimitPerUser => _rateLimitPerUser;

  List get recipients => _recipients;

  String get icon => _icon;

  int get ownerId => _ownerId;

  int get applicationId => _applicationId;

  int get parentId => _parentId;

  Channel(
    this._id,
    this._type,
    this._guildId,
    this._position,
    this._permissionOverwrites,
    this._name,
    this._topic,
    this._nsfw,
    this._lastMessageId,
    this._bitrate,
    this._userLimit,
    this._rateLimitPerUser,
    this._recipients,
    this._icon,
    this._ownerId,
    this._applicationId,
    this._parentId,
    this._lastPinTimestamp,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'type': _type,
      'guild_id': _guildId,
      'position': _position,
      'permission_overwrites':
          _permissionOverwrites?.map((x) => x?.toMap())?.toList(),
      'name': _name,
      'topic': _topic,
      'nsfw': _nsfw,
      'last_message_id': _lastMessageId,
      'bitrate': _bitrate,
      'user_limit': _userLimit,
      'rate_limit_per_user': _rateLimitPerUser,
      'recipients': _recipients?.map((x) => x?.toMap())?.toList(),
      'icon': _icon,
      'owner_id': _ownerId,
      'application_id': _applicationId,
      'parent_id': _parentId,
      'last_pin_timestamp': _lastPinTimestamp?.millisecondsSinceEpoch,
    };
  }

  static Channel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Channel(
      int.tryParse(map['id']),
      map['type'],
      int.tryParse(map['guild_id']),
      map['position'],
      List<Overwrite>.from(
          map['permission_overwrites']?.map((x) => Overwrite.fromMap(x))),
      map['name'],
      map['topic'],
      map['nsfw'],
      map['last_message_id'] != null
          ? int.tryParse(map['last_message_id'])
          : null,
      map['bitrate'],
      map['user_limit'],
      map['rate_limit_per_user'],
      map['recipients'] != null
          ? List<User>.from(map['recipients']?.map((x) => User.fromMap(x)))
          : null,
      map['icon'],
      map['owner_id'] != null ? int.tryParse(map['owner_id']) : null,
      map['application_id'] != null
          ? int.tryParse(map['application_id'])
          : null,
      map['parent_id'] != null ? int.tryParse(map['parent_id']) : null,
      map['last_pin_timestamp'] != null
          ? DateTime(map['last_pin_timestamp'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  static Channel fromJson(String source) => fromMap(json.decode(source));

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Channel && o._id == _id;
  }
}
