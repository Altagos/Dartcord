part of datcord_ext_command;

abstract class CommandClass {
  String _name;
  String _description;
  List<String> _aliases;
  bool _hidden;

  CommandClass(String name, { String description, List<String> aliases, bool hidden }) {
    _name = name;
    _description = description;
    _aliases = aliases;
    _hidden = hidden;
  }

  void run() {}
}