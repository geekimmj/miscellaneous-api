class Config {
  static final Config _instance = Config._internal();
  final String apiKey;

  Config._internal():
      apiKey = String.fromEnvironment("API_KEY", defaultValue: "DEFAULT_API_KEY");

  factory Config.getConfig() {
    return _instance;
  }
}
