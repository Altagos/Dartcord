part of dartcord;

class Role {
  int _id;
  String _name;
  int _permissions;
  int _position;
  int _color;
  bool _hoist;
  bool _managed;
  bool _mentionable;

  Role(this._id, this._name, this._permissions, this._position, this._color,
      this._hoist, this._managed, this._mentionable);

  Role.fromJson(Map<String, dynamic> json) {
    _id = int.tryParse(json['id'].toString());
    _name = json['name'];
    _permissions = int.tryParse(json['permissions'].toString());
    _position = int.tryParse(json['position'].toString());
    _color = int.tryParse(json['color'].toString());
    _hoist = json['hoist'];
    _managed = json['managed'];
    _mentionable = json['mentionable'];
  }

  int get id => _id;

  String get name => _name;

  int get permissions => _permissions;

  int get position => _position;

  int get color => _color;

  bool get hoist => _hoist;

  bool get managed => _managed;

  bool get mentionable => _mentionable;
}
