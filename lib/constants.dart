import 'package:enum_to_string/enum_to_string.dart';
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

enum Flavor {
  development,
  production,
}

@immutable
class Constants {
  final String endpoint;
  final String apiKey;

  static const String pageHome = "/home";
  static const String pageSignIn = "/sighIn";
  static const String pageDetail = "/detail";

  static Constants _instance;

  const Constants({
    @required this.endpoint,
    @required this.apiKey,
  });

  factory Constants.of() {
    if (_instance != null) {
      return _instance;
    }

    final flavor = EnumToString.fromString(
      Flavor.values,
      String.fromEnvironment("FLAVOR"),
    );

    switch (flavor) {
      case Flavor.development:
        _instance = Constants._dev();
        break;
      case Flavor.production:
      default:
        _instance = Constants._prd();
    }
    return _instance;
  }

  factory Constants._dev() {
    return const Constants(
      endpoint: "https://newsapi.org",
      apiKey: "df66b087947546ce9e74eb68eeca3d81",
    );
  }

  factory Constants._prd() {
    return const Constants(
      endpoint: "https://newsapi.org",
      apiKey:
          "df66b087947546ce9e74eb68eeca3d81", // TODO:リリースの場合はライセンスによって変える必要がある
    );
  }
}
