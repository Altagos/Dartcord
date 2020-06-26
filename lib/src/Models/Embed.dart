part of dartcord;

class Embed {
  String _title;
  String _description;
  String _url;
  Color _color; // TODO: replace with Color Object
  DateTime _timestamp;
  Map<String, dynamic> _thumbnail;
  Map<String, String> _footer;
  Map<String, dynamic> _image;
  Map<String, dynamic> _video;
  Map<String, String> _provider;
  Map<String, String> _author;
  final List<Map> _fields = [];

  Embed(
      {String title,
      String description,
      String url,
      Color color,
      DateTime timestamp}) {
    _title = title;
    _description = description;
    _url = url;
    _color = color;
    _timestamp = timestamp != null ? DateTime.now() : timestamp;
  }

  String get title => _title;

  set title(String title) => _title = title;

  String get description => _description;

  set description(String description) => _description = description;

  String get url => _url;

  set url(String url) => _url = url;

  Color get color => _color;

  set color(Color color) => _color = color;

  DateTime get timestamp => _timestamp;

  set timestamp(DateTime timestamp) => _timestamp = timestamp;

  Map get thumbnail => _thumbnail;

  Map get footer => _footer;

  Map get image => _image;

  Map get video => _video;

  Map get provider => _provider;

  Map get author => _author;

  List get fields => _fields;

  void setThumbnail({String url, String proxyUrl, int height, int width}) {
    _thumbnail['url'] = url;
    _thumbnail['proxy_url'] = proxyUrl;
    _thumbnail['height'] = height;
    _thumbnail['width'] = width;
  }

  void setFooter({String name, String iconUrl, String proxyIconUrl}) {
    _footer['name'] = name;
    _footer['icon_url'] = iconUrl;
    _footer['proxy_icon_url'] = proxyIconUrl;
  }

  void setImage({String url, String proxyUrl, int height, int width}) {
    _image['url'] = url;
    _image['proxy_url'] = proxyUrl;
    _image['height'] = height;
    _image['width'] = width;
  }

  void setVideo({String url, int height, int width}) {
    _video['url'] = url;
    _video['height'] = height;
    _video['width'] = width;
  }

  void setProvider({
    String name,
    String url,
  }) {
    _provider['name'] = name;
    _provider['url'] = url;
  }

  void setAuthor(
      {String name, String url, String iconUrl, String proxyIconUrl}) {
    _author['name'] = name;
    _author['url'] = url;
    _author['icon_url'] = iconUrl;
    _author['proxy_icon_url'] = proxyIconUrl;
  }

  void setColor(Color color) {
    _color = color;
  }

  void addField({String name, String value, bool inline}) {
    var map = {};
    map['name'] = name;
    map['value'] = value;
    map['inline'] = inline;
    _fields.add(map);
  }

  String toJson() {
    var embed = {};

    embed['title'] = _title;
    embed['description'] = _description;
    embed['url'] = _url;
    embed['timestamp'] = _timestamp;
    embed['color'] = _color.colorCode;
    embed['footer'] = _footer;
    embed['image'] = _image;
    embed['thumbnail'] = _thumbnail;
    embed['video'] = _video;
    embed['provider'] = _provider;
    embed['author'] = _author;
    embed['fields'] = _fields;

    return jsonEncode(embed);
  }

  Map embed() {
    var embed = {};

    if (_title.isNotEmpty != null) {
      embed['title'] = _title;
    }
    if (_description != null) {
      embed['description'] = _description;
    }
    if (_url != null) {
      embed['url'] = _url;
    }
    if (_timestamp != null) {
      embed['timestamp'] = _timestamp;
    }
    if (_color != null) {
      embed['color'] = _color.colorCode;
    }
    if (_footer != null) {
      embed['footer'] = _footer;
    }
    if (_image != null) {
      embed['image'] = _image;
    }
    if (_thumbnail != null) {
      embed['thumbnail'] = _thumbnail;
    }
    if (_video != null) {
      embed['video'] = _video;
    }
    if (_provider != null) {
      embed['provider'] = _provider;
    }
    if (_author != null) {
      embed['author'] = _author;
    }
    if (_fields != null) {
      embed['fields'] = _fields;
    }

    return embed;
  }
}
