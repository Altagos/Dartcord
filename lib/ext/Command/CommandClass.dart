part of datcord_ext_command;

abstract class CommandClass {
  String _name;
  String _description;
  List<String> _aliases;

  CommandClass({String name, String description, List<String> aliases }) {
    _name = name;
    _description = description;
    _aliases = aliases;
  }

  void run() {}
}