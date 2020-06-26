/// Support for doing something awesome.
///
/// More dartdocs go here.
library dartcord;

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:quiver/cache.dart';
import 'package:web_socket_channel/io.dart';

part 'src/Client/Client.dart';
part 'src/Client/Rest.dart';
part 'src/Client/WebSocket.dart';

part 'src/Constants/Constants.dart';
part 'src/Constants/Endpoints.dart';
part 'src/Constants/Events.dart';

part 'src/Events/DataEvent.dart';
part 'src/Events/Event.dart';
part 'src/Events/EventHandler.dart';
part 'src/Events/handlers/Channel/ChannelCreateEvent.dart';
part 'src/Events/handlers/Channel/ChannelDeleteEvent.dart';
part 'src/Events/handlers/Channel/ChannelPinsUpdateEvent.dart';
part 'src/Events/handlers/Channel/ChannelUpdateEvent.dart';
part 'src/Events/handlers/Guild/GuildCreateEvent.dart';
part 'src/Events/handlers/Message/MessageCreateEvent.dart';
part 'src/Events/handlers/ReadyEvent.dart';

part 'src/Models/Channel.dart';
part 'src/Models/ClientUser.dart';
part 'src/Models/Embed.dart';
part 'src/Models/Emoji.dart';
part 'src/Models/Guild.dart';
part 'src/Models/Message.dart';
part 'src/Models/Overwrite.dart';
part 'src/Models/Payload.dart';
part 'src/Models/Role.dart';
part 'src/Models/User.dart';
part 'src/Models/Game.dart';

part 'src/Util/Color.dart';
part 'src/Util/Util.dart';

// TODO: Export any libraries intended for clients of this package.
