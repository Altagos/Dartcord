part of datcord_ext_command;

class Command {
  final String _name;
  Function _function;
  bool _disabled = false;
  final String _description;
  final List<String> aliases;
  final bool hidden;

  Command(this._name, this._description, this.aliases, this.hidden, {Function function}) {
    _function = function;
  }

  String get name => _name;

  set function(Function function) => _function = function;

  set disabled(bool disabled) => _disabled = disabled;
}