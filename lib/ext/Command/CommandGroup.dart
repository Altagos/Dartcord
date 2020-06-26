part of datcord_ext_command;

class CommandGroup {
  final String _name;
  final Commander _client;

  CommandGroup(this._client, this._name);

  String get name => _name;

  void add<T>({Function command, String name, String description, List<String> aliases, bool hidden = false}) {
    if (T == dynamic) {
      _client.commandLoader.add(_name, Command(name, description, aliases, hidden, function: command));
    } else if (T.runtimeType == CommandClass) {

    }
  }
}