part of datcord_ext_command;

abstract class CommandClass extends Command {
  CommandClass(String name, String description, List<String> aliases, bool hidden) : super(name, description, aliases, hidden) {
    _function = run;
  }

  void run() {}
}