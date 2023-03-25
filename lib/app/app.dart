import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../core/utils/functions.dart';
import '../core/utils/theme.dart';
import '../core/utils/timeago_messages.dart';
import '../features/auth/data/store/auth_cubit.dart';
import 'routing/routes.dart';



class App extends StatelessWidget {

  final AdaptiveThemeMode? savedThemeMode;

  const App({this.savedThemeMode, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(

      light: lightTheme(context),
      dark: darkTheme(context),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (ThemeData theme, ThemeData darkTheme) {
        return MultiBlocProvider(
            providers: [
              /// Register global providers
              BlocProvider(create: (context) => AuthCubit()),
            ],
            child: MaterialApp.router(
              title: 'Paperless Listings',
              darkTheme: darkTheme,
              debugShowCheckedModeBanner: false,
              theme: theme,
              routerConfig: router,
              builder: (ctx, widget) {
                timeago.setLocaleMessages('en', TimeagoMessages());
                // all initializations of app status bar, app navigation bar setup
                setAppSystemOverlay(theme: theme, useThemeOverlays: true);
                return widget!;
              },
            )
        );
      },
    );
  }
}
