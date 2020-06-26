part of dartcord;

class Color {
  final int _colorCode;

  int get colorCode => _colorCode;

  Color(this._colorCode);

  static Color hex(String hex) {
    return Color(hex.startsWith('0x') == true
        ? int.parse(hex)
        : int.parse(hex, radix: 16));
  }

  static Color rgb(int r, int g, int b) {
    var color = (r << 16) + (g << 8) + b;
    return Color(color);
  }

  @override
  String toString() {
    return _colorCode.toString();
  }
}
