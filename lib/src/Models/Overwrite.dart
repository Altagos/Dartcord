part of dartcord;

class Overwrite {
  final int _id;
  final String _type;
  final int _allow;
  final int _deny;

  Overwrite(this._id, this._type, this._allow, this._deny);

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'type': _type,
      'allow': _allow,
      'deny': _deny,
    };
  }

  static Overwrite fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Overwrite(
      map['_id'],
      map['_type'],
      map['_allow'],
      map['_deny'],
    );
  }

  String toJson() => json.encode(toMap());

  static Overwrite fromJson(String source) => fromMap(json.decode(source));
}
