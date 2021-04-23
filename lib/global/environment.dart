import 'package:flutter/material.dart';

enum Environment {
  dev,
  prod,
}

class EnvironmentConfigs {
  final String apiUrl;
  final String apiKey;
  final String frontendUrl;

  const EnvironmentConfigs({
    @required this.apiUrl,
    @required this.apiKey,
    @required this.frontendUrl,
  });
}

const Map<Environment, EnvironmentConfigs> _environmentWithConfigsMap = {
  Environment.dev: const EnvironmentConfigs(
    apiUrl: 'http://192.168.1.141:5001/stockwise-f24fe/us-central1/',
    apiKey: '',
    frontendUrl: 'https://stockwise.io/',
  ),
  Environment.prod: const EnvironmentConfigs(
    apiUrl: 'https://us-central1-stockwise-f24fe.cloudfunctions.net/',
    apiKey: '',
    frontendUrl: 'https://stockwise.io/',
  ),
};

class EnvironmentUtil {
  static Environment _currentEnvironment;

  static EnvironmentConfigs _currentEnvironmentConfigs;

  static void setEnvironment(Environment env) {
    _currentEnvironment = env;
    _currentEnvironmentConfigs = _environmentWithConfigsMap[env];
  }

  static Environment getEnvironment() {
    return _currentEnvironment;
  }

  static EnvironmentConfigs getEnvironmentConfigs() {
    return _currentEnvironmentConfigs;
  }
}
