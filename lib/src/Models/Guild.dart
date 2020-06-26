part of dartcord;

class Guild {
  int _id;
  String _name;
  String _icon;
  String _description;
  String _splash;
  String _discoverySplash;
  List _features;
  Map<int, Emoji> _emojis = <int, Emoji>{};
  String _banner;
  int _ownerId;
  int _applicationId;
  String _region;
  int _afkChannelId;
  int _afkTimeout;
  int _systemChannelId;
  bool _widgetEnabled;
  int _widgetChannelId;
  int _verificationLevel;
  Map<int, Role> _roles = <int, Role>{};
  int _defaultMessageNotifications;
  int _mfaLevel;
  int _explicitContentFilter;
  int _maxPresences;
  int _maxMembers;
  int _maxVideoChannelUsers;
  String _vanityUrlCode;
  int _premiumTier;
  int _premiumSubscriptionCount;
  int _systemChannelFlags;
  String _preferredLocal;
  int _rulesChannelId;
  int _publicUpdatesChannelId;
  bool _embedEnabled;
  int _embedChannelId;

  int get id => _id;

  String get name => _name;

  String get icon => _icon;

  String get description => _description;

  String get splash => _splash;

  String get discoverySplash => _discoverySplash;

  List get features => _features;

  Map<int, Emoji> get emojis => _emojis;

  String get banner => _banner;

  int get ownerId => _ownerId;

  int get applicationId => _applicationId;

  String get region => _region;

  int get afkChannelId => _afkChannelId;

  int get afkTimeout => _afkTimeout;

  int get systemChannelId => _systemChannelId;

  bool get widgetEnabled => _widgetEnabled;

  int get widgetChannelId => _widgetChannelId;

  int get verificationLevel => _verificationLevel;

  Map<int, Role> get roles => _roles;

  int get defaultMessageNotifications => _defaultMessageNotifications;

  int get mfaLevel => _mfaLevel;

  int get explicitContentFilter => _explicitContentFilter;

  int get maxPresences => _maxPresences;

  int get maxMembers => _maxMembers;

  int get maxVideoChannelUsers => _maxVideoChannelUsers;

  String get vanityUrlCode => _vanityUrlCode;

  int get premiumTier => _premiumTier;

  int get premiumSubscriptionCount => _premiumSubscriptionCount;

  int get systemChannelFlags => _systemChannelFlags;

  String get preferredLocal => _preferredLocal;

  int get rulesChannelId => _rulesChannelId;

  int get publicUpdatesChannelId => _publicUpdatesChannelId;

  bool get embedEnabled => _embedEnabled;

  int get embedChannelId => _embedChannelId;

  Guild(
      this._id,
      this._name,
      this._icon,
      this._description,
      this._splash,
      this._discoverySplash,
      this._features,
      this._emojis,
      this._banner,
      this._ownerId,
      this._applicationId,
      this._region,
      this._afkChannelId,
      this._afkTimeout,
      this._systemChannelId,
      this._widgetEnabled,
      this._widgetChannelId,
      this._verificationLevel,
      this._roles,
      this._defaultMessageNotifications,
      this._mfaLevel,
      this._explicitContentFilter,
      this._maxPresences,
      this._maxMembers,
      this._maxVideoChannelUsers,
      this._vanityUrlCode,
      this._premiumTier,
      this._premiumSubscriptionCount,
      this._systemChannelFlags,
      this._preferredLocal,
      this._rulesChannelId,
      this._publicUpdatesChannelId,
      this._embedEnabled,
      this._embedChannelId);

  Guild.fromJson(Map<String, dynamic> json) {
    if (json['roles'] != null) {
      for (var role in json['roles']) {
        _roles[int.tryParse(role['id'].toString())] = Role.fromJson(role);
      }
    }
    if (json['emojis'] != null) {
      for (var emoji in json['emojis']) {
        _emojis[int.tryParse(emoji['id'].toString())] = Emoji.fromJson(emoji);
      }
    }
    _id = int.tryParse(json['id'].toString());
    _name = json['name'];
    _icon = json['icon'];
    _description = json['description'];
    _splash = json['splash'];
    _discoverySplash = json['discovery_splash'];
    _features = json['features'];
    _banner = json['banner'];
    _ownerId = int.tryParse(json['owner_id'].toString());
    _applicationId = int.tryParse(json['application_id'].toString());
    _region = json['region'];
    _afkChannelId = int.tryParse(json['afk_channel_id'].toString());
    _afkTimeout = int.tryParse(json['afk_timeout'].toString());
    _systemChannelId = int.tryParse(json['system_channel_id'].toString());
    _widgetEnabled = json['widget_enabled'];
    _widgetChannelId = int.tryParse(json['widget_channel_id'].toString());
    _verificationLevel = int.tryParse(json['verification_level'].toString());
    _defaultMessageNotifications =
        int.tryParse(json['default_message_notifications'].toString());
    _mfaLevel = int.tryParse(json['mfa_level'].toString());
    _explicitContentFilter =
        int.tryParse(json['explicit_content_filter'].toString());
    _maxPresences = int.tryParse(json['max_presences'].toString());
    _maxMembers = int.tryParse(json['max_members'].toString());
    _maxVideoChannelUsers =
        int.tryParse(json['max_video_channel_users'].toString());
    _vanityUrlCode = json['vanity_url_code'];
    _premiumTier = int.tryParse(json['premium_tier'].toString());
    _premiumSubscriptionCount =
        int.tryParse(json['premium_subscription_count'].toString());
    _systemChannelFlags = int.tryParse(json['system_channel_flags'].toString());
    _preferredLocal = json['preferred_locale'];
    _rulesChannelId = int.tryParse(json['rules_channel_id'].toString());
    _publicUpdatesChannelId =
        int.tryParse(json['public_updates_channel_id'].toString());
    _embedEnabled = json['embed_enabled'];
    _embedChannelId = int.tryParse(json['embed_channel_id'].toString());
  }
}
