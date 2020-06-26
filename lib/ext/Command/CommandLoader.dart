part of datcord_ext_command;

class CommandLoader {
  final Commander _client;
  Map<String, Map<String, Command>> _commands;

  CommandLoader(this._client);

  void add(String groupName, Command command) {
    _commands[groupName][command.name] = command;
  }
}