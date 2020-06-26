part of datcord_ext_command;

class Commander extends Client {
  CommandLoader _commandLoader;

  Commander(String token) : super(token) {
    _commandLoader = CommandLoader(this);
  }

  CommandLoader get commandLoader => _commandLoader;
}