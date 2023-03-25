// GoRouter configuration
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:paperless_listings/app/routing/route_constants.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(
// initialLocation: homePageRoute,
  debugLogDiagnostics: true,
  navigatorKey: _rootNavigator,
  redirect: (BuildContext context, state) async {
    final List<String> guestRoutes = [
      logInPageRoute,
    ];
// check if user has loggedIn
//     final AuthRepository authRepository = sl<AuthRepository>();
//     final loggedIn = await authRepository.getCurrentLoggedInUser();

//     if (!guestRoutes.contains(state.subloc) && !loggedIn) {
// // if user is not logged in and user is not navigating to a guest route
//       return landingPageRoute;
//     } else {
//       return null;
//     }

      return null;
  },
  routes: [

  ],
);