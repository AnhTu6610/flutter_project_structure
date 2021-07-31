import 'package:flutter_project_structure/data_source/network_data/endpoint_api.dart';

enum Flavor { DEV, STAG, PROD }

class FlavorValuesConfig {
  final Flavor flavor;
  FlavorValuesConfig({required this.flavor}) {
    configNetwork();
    configDataSource();
  }
  configNetwork() {
    switch (flavor) {
      case Flavor.DEV:
        domainAPI = EndPoint.domainDev;
        break;
      case Flavor.STAG:
        domainAPI = EndPoint.domainStag;
        break;
      case Flavor.PROD:
        domainAPI = EndPoint.domainProd;
        break;
      default:
    }
  }

  configDataSource() {}
}

class FlavorConfig {
  final Flavor flavor;
  final String name;
  static late FlavorConfig _instance;

  FlavorConfig._internal(this.flavor, this.name);

  factory FlavorConfig({required Flavor flavor, required String name}) {
    FlavorValuesConfig(flavor: flavor);
    _instance = FlavorConfig._internal(flavor, name);
    return _instance;
  }

  static FlavorConfig get instance {
    return _instance;
  }

  static bool isDevelopment() => _instance.flavor == Flavor.DEV;
  static bool isStaging() => _instance.flavor == Flavor.STAG;
  static bool isProduction() => _instance.flavor == Flavor.PROD;
}
