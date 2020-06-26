part of dartcord;

class Game {
  final String _name;
  final int _type;
  String _url;

  Game(this._name, this._type, {String url}) {
    _url = url;
  }

  String get name => _name;
  int get type => _type;
  String get url => _url;

  Map toMap() {
    var map = {};
    map['name'] = _name;
    map['type'] = _type;
    if (_url != null) {
      map['url'] = _url;
    }
    return map;
  }
}
