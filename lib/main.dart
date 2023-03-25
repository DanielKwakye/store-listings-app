import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app/app.dart';
import 'core/utils/injector.dart' as di;

Future<void> main() async {
  // Ensure all dependencies are initialized
  WidgetsFlutterBinding.ensureInitialized();

  //only portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // so that the status bar will show on IOS
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.top,
    SystemUiOverlay.bottom,
  ]);

  //
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // get current theme mode
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  WidgetsFlutterBinding.ensureInitialized();


  // All dependence injections
  // dependencies are registered lazily to boost app performance
  await di.init();

  // app starts here
  runApp(App(savedThemeMode:  savedThemeMode,));

}