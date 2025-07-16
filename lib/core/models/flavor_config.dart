enum Flavor { dev, prod }

class FlavorConfig {
  final Flavor flavor;
  final String baseUrl;

  static late FlavorConfig instance;

  FlavorConfig._(this.flavor, this.baseUrl);

  static void initialize({
    required Flavor flavor,
    required String baseUrl,
  }) {
    instance = FlavorConfig._(flavor, baseUrl);
  }

  static Flavor get current => instance.flavor;
  static String get apiBaseUrl => instance.baseUrl;
}
