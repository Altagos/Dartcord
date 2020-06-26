part of dartcord;

class ClientUser {
  final String _username;
  final int _discriminator;
  final bool _verified;
  final int _id;
  final int _flags;
  final String _email;
  final bool _bot;
  final String _avatar;

  String get username => _username;

  int get discriminator => _discriminator;

  bool get verified => _verified;

  int get id => _id;

  int get flags => _flags;

  String get email => _email;

  bool get bot => _bot;

  String get avatar => _avatar;

  ClientUser(this._username, this._discriminator, this._verified, this._id,
      this._flags, this._email, this._bot, this._avatar);

  static ClientUser fromJson(Map<String, dynamic> json) {
    return ClientUser(
        json['username'],
        int.tryParse(json['discriminator']),
        json['verified'],
        json['id'] != null ? int.tryParse(json['id']) : 0,
        int.tryParse(json['flags'].toString()),
        json['email'],
        json['bot'],
        json['avatar']);
  }
}
