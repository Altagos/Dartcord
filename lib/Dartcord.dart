/// Support for doing something awesome.
///
/// More dartdocs go here.
library dartcord;

import 'dart:async';
import 'dart:convert';

import 'package:web_socket_channel/io.dart';

part 'src/Client/Client.dart';
part 'src/Client/WebSocket.dart';

part 'src/Constants/Events.dart';
part 'src/Constants/Constants.dart';

// Models
part 'src/Models/Message.dart';
part 'src/Models/Payload.dart';
part 'src/Models/User.dart';

// Events
part 'src/Events/EventHandler.dart';
part 'src/Events/Event.dart';
// Handlers
part 'src/Events/handlers/ReadyEvent.dart';
part 'src/Events/handlers/MessageCreateEvent.dart';

// Util
part 'src/Util/Util.dart';
// TODO: Export any libraries intended for clients of this package.
