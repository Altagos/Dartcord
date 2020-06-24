part of dartcord;

class User {
  final int _id;
  final String _username;
  final String _discriminator;
  final String _avatar;
  final bool _bot;
  final bool _system;
  final bool _mfaEnabled;
  final String _local;
  final bool _verified;
  final String _email;
  final int _flags;
  final int _premiumType;
  final int _publicFlags;

  int get id => _id;
  String get username => _username;
  String get discriminator => _discriminator;
  String get avatar => _avatar;
  bool get bot => _bot;
  bool get system => _system;
  bool get mfaEnabled => _mfaEnabled;
  String get local => _local;
  bool get verified => _verified;
  String get email => _email;
  int get flags => _flags;
  int get premiumType => _premiumType;
  int get publicFlags => _publicFlags;

  User(
      this._id,
      this._username,
      this._discriminator,
      this._avatar,
      this._bot,
      this._system,
      this._mfaEnabled,
      this._local,
      this._verified,
      this._email,
      this._flags,
      this._premiumType,
      this._publicFlags);

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'username': _username,
      'discriminator': _discriminator,
      'avatar': _avatar,
      'bot': _bot,
      'system': _system,
      'mfa_enabled': _mfaEnabled,
      'local': _local,
      'verified': _verified,
      'email': _email,
      'flags': _flags,
      'premium_type': _premiumType,
      'public_flags': _publicFlags,
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return User(
      int.tryParse(map['id']),
      map['username'],
      map['discriminator'],
      map['avatar'],
      map['bot'],
      map['system'],
      map['mfa_enabled'],
      map['local'],
      map['verified'],
      map['email'],
      map['flags'] != null ? int.tryParse(map['flags']) : null,
      map['premium_type'] != null ? int.tryParse(map['premium_type']) : null,
      map['public_flags'],
    );
  }

  String toJson() => json.encode(toMap());

  static User fromJson(String source) => fromMap(json.decode(source));
}
