/// Get your own App ID at https://dashboard.agora.io/
String get appId {
  // Allow pass an `appId` as an environment variable with name `TEST_APP_ID` by using --dart-define
  return const String.fromEnvironment(
    'TEST_APP_ID',
    defaultValue: '41019619f375437fa941d7d995b9f103',
  );
}

/// Please refer to https://docs.agora.io/en/Agora%20Platform/token
String get token {
  // Allow pass a `token` as an environment variable with name `TEST_TOKEN` by using --dart-define
  return const String.fromEnvironment(
    'TEST_TOKEN',
    defaultValue:
        '007eJxTYHjh2S/eNqVGxP78IT0987j5ffpn/3AvLemXdjeR6uxf9k+BwcTQwNDSzNAyzdjc1MTYPC3R0sQwxTzF0tI0yTLN0MD4Y+ec9IZARgaVeeUMjFAI4vMwFOUXJ+YllhQllqXmMDAAAM2aISU=',
  );
}

/// Your channel ID
String get channelId {
  // Allow pass a `channelId` as an environment variable with name `TEST_CHANNEL_ID` by using --dart-define
  return const String.fromEnvironment(
    'TEST_CHANNEL_ID',
    defaultValue: 'rosanatravel',
  );
}

/// Your int user ID
const int uid = 0;

/// Your user ID for the screen sharing
const int screenSharingUid = 10;

/// Your string user ID
const String stringUid = '0';
