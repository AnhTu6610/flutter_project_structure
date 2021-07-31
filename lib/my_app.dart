import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_project_structure/app_localizations.dart';
import 'package:flutter_project_structure/data_source/local_data/prefs_name.dart';
import 'package:flutter_project_structure/data_source/local_data/prefs_provider.dart';
import 'package:flutter_project_structure/flavor-config.dart';
import 'package:flutter_project_structure/generate_route.dart';
import 'package:flutter_project_structure/theme_material_app.dart';
import 'package:flutter_project_structure/views/splash/splash_screen.dart';

class StateManager {
  static GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
  static String language = "vi";
  static AppLifecycleState stateApp = AppLifecycleState.resumed;
}

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    state.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GenerateRoute _generateRoute = new GenerateRoute();
  ThemeMaterialApp _themeMaterialApp = new ThemeMaterialApp();
  Locale _locale = new Locale("vi");

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
      setState(() {
        if (locale.languageCode == "vi")
          StateManager.language = "vi";
        else
          StateManager.language = "eng";
      });
    });
  }

  @override
  void didChangeDependencies() {
    PrefsProvider.getString(PrefsNames.LANGUAGE_CODE, def: "vi").then((value) {
      setState(() {
        this._locale = Locale(value!);
        if (value == "vi")
          StateManager.language = "vi";
        else
          StateManager.language = "eng";
      });
    });
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return LifeCycleManager(
      child: MaterialApp(
        title: FlavorConfig.instance.name,
        navigatorKey: StateManager.navigatorKey,
        debugShowCheckedModeBanner: true,
        onGenerateRoute: (setting) => _generateRoute.checkRoute(setting),
        home: SplashScreen(),
        theme: _themeMaterialApp.themeData,
        locale: _locale,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale!.languageCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        supportedLocales: [
          const Locale('vi', 'VN'),
          const Locale('en', 'US'),
        ],
      ),
    );
  }
}

class LifeCycleManager extends StatefulWidget {
  LifeCycleManager({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  _LifeCycleManagerState createState() => _LifeCycleManagerState();
}

class _LifeCycleManagerState extends State<LifeCycleManager> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('#====>>> AppLifecycleState: $state');
    StateManager.stateApp = state;
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }
}
