part of datcord_ext_command;

class Command {
  String _name;
  Function _function;
  bool _disabled = false;
  String _description;
  List<String> _aliases;
  bool _hidden;

  Command(String name, String description, List<String> aliases, bool hidden,
      {Function function}) {
    _name = name;
    _description = description;
    _aliases = aliases;
    _hidden = hidden;
    _function = function;
  }

  String get name => _name;
  String get description => _description;
  List<String> get aliases => _aliases;
  bool get hidden => _hidden;
  bool get disabled => _disabled;
  Function get function => _function;

  set description(String description) => _description = description;
  set aliases(List<String> aliases) => _aliases = aliases;
  set function(Function function) => _function = function;
  set disabled(bool disabled) => _disabled = disabled;
}
