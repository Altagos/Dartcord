part of datcord_ext_command;

class Commander extends Client {
  CommandLoader _commandLoader;
  final String _prefix;

  Commander(String token, this._prefix) : super(token) {
    _commandLoader = CommandLoader(this);
    on<MessageCreateEvent>().listen((MessageCreateEvent event) {
      if (event.message.content.startsWith(_prefix) && event.message.author.id != user.id) {
        var message = event.message.content.split(' ');
        var command = message[0].substring(_prefix.length);
        print(command);
      } else {
        return super.on<MessageCreateEvent>();
      }
    });
  }

  CommandLoader get commandLoader => _commandLoader;

  @override
  Stream<T> on<T>() {
    if (T is MessageCreateEvent) {
      on<MessageCreateEvent>().listen((MessageCreateEvent event) {
        if (event.message.content.startsWith(_prefix) && event.message.author.id != user.id) {
          var message = event.message.content.split(' ');
          var command = message[0].substring(_prefix.length);
          print(command);
        } else {
          return super.on<T>();
        }
      });
    }
    return super.on<T>();
  }
}