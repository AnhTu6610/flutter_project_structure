import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project_structure/data_source/firebase_database/firestore_db.dart';
import 'package:flutter_project_structure/data_source/local_data/hive_provider.dart';
import 'package:flutter_project_structure/flavor-config.dart';
import 'package:flutter_project_structure/my_app.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  FlavorConfig(flavor: Flavor.DEV, name: "App Dev");
  await Firebase.initializeApp();
  await FirestoreDB.initialize();
  await HiveProvider.init();
  runApp(MyApp()
      // MultiProvider(
      //   child: MyApp(),
      //   providers: <SingleChildWidget>[
      //     ChangeNotifierProvider<BlocUser>(create: (_) => BlocUser()),
      //   ],
      // ),
      );
}
