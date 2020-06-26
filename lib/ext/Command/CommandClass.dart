part of datcord_ext_command;

abstract class CommandClass extends Command {
  CommandClass(
      String name, {String description = '', List<String> aliases, bool hidden = false}) : super(name, description, aliases, hidden);

  void run() {}
}