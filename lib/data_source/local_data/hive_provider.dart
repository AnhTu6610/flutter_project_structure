import 'package:flutter_project_structure/models/base_model/mess_hive_field.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveProvider {
  static const String boxNameA = "boxA";
  static const String boxNameB = "boxB";
  static Box? boxA;
  static Box? boxB;
  /* Call only once at the main function */
  static init() async {
    Hive
      ..initFlutter()
      ..registerAdapter(MessHiveFieldAdapter())
      ..registerAdapter(MessPublicHiveFieldAdapter());
  }
}
