part of dartcord;

class Emoji {
  int _id;
  String _name;
  List<String> _roles;
  User _user;
  bool _requireColons;
  bool _managed;
  bool _animated;

  Emoji(this._id, this._name, this._roles, this._user, this._requireColons,
      this._managed, this._animated);

  int get id => _id;

  String get name => _name;

  List<String> get roles => _roles;

  User get user => _user;

  bool get requireColons => _requireColons;

  bool get managed => _managed;

  bool get animated => _animated;

  Emoji.fromJson(Map<String, dynamic> json) {
    _id = int.tryParse(json['id'].toString());
    _name = json['name'];
    _roles = json['roles'].cast<String>();
    _user = User.fromMap(json['user']);
    _requireColons = json['require_colons'];
    _managed = json['managed'];
    _animated = json['animated'];
  }

  @override
  String toString() {
    return '<:$_name:$_id>';
  }
}
