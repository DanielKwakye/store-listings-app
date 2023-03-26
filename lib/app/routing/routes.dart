// GoRouter configuration
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:paperless_listings/app/routing/route_constants.dart';
import 'package:paperless_listings/features/gallery/presentation/pages/index.dart';

import '../../core/utils/injector.dart';
import '../../features/auth/data/repositories/auth_repository.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(

  debugLogDiagnostics: true,
  navigatorKey: _rootNavigator,
  redirect: (BuildContext context, state) async {
    final List<String> guestRoutes = [
      galleryPageRoute,
      faqPageRoute,
      logInPageRoute
    ];
    // check if user has loggedIn
    final AuthRepository authRepository = sl<AuthRepository>();
    final loggedIn = await authRepository.getCurrentLoggedInUser();

    // if user is not logged in and user is not navigating to a guest route
    if (!guestRoutes.contains(state.subloc) && !loggedIn) {
      return logInPageRoute;
    }

    return null;

  },
  initialLocation: galleryPageRoute,
  routes: [

    GoRoute(
      path: galleryPageRoute,
      builder: (context, state) => const IndexPage(),
    ),

  ],
);