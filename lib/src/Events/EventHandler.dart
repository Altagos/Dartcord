part of dartcord;

abstract class EventHandler {
  final StreamController _streamController = StreamController.broadcast();

  StreamController get streamController => _streamController;

  Stream<T> on<T>() {
    if (T == dynamic) {
      return _streamController.stream;
    } else {
      return _streamController.stream.where((event) => event is T).cast<T>();
    }
  }

  void fire(Event event) {
    _streamController.add(event);
  }

  void emit(Event event) {
    _streamController.add(event);
  }

  void destroy() {
    _streamController.close();
  }
}
