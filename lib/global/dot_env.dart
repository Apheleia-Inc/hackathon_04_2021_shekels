class DotEnvConfigs {
  final String stripeApiKey;

  const DotEnvConfigs({
    this.stripeApiKey,
  });
}

class DotEnvUtils {
  static DotEnvConfigs _dotEnvConfigs;

  static void setDotEnvConfigs(Map<String, String> dotEnv) {
    _dotEnvConfigs = DotEnvConfigs(
      stripeApiKey: dotEnv['STRIPE_API_KEY'],
    );
  }

  static DotEnvConfigs getDotEnvConfigs() {
    return _dotEnvConfigs;
  }
}
