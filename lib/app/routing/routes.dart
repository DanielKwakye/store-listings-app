import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:paperless_listings/app/routing/route_constants.dart';
import 'package:paperless_listings/core/utils/enums.dart';
import 'package:paperless_listings/features/account/presentation/pages/account_page.dart';
import 'package:paperless_listings/features/auth/presentation/pages/auth_page.dart';
import 'package:paperless_listings/features/faq/presentation/pages/faq_sub_page.dart';
import 'package:paperless_listings/features/gallery/presentation/pages/gallery_sub_page.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_error_widget.dart';
import 'package:paperless_listings/features/index/presentation/pages/index_page.dart';
import 'package:paperless_listings/features/kyc/presentation/pages/kyc_page.dart';
import 'package:paperless_listings/features/plugins/presentation/pages/plugins_sub_page.dart';
import '../../core/utils/injector.dart';
import '../../features/auth/data/repositories/auth_repository.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey<NavigatorState>(debugLabel: 'root');
GlobalKey<NavigatorState> _accountShellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'account-shell');
GlobalKey<NavigatorState> _indexShellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'index-shell');

final router = GoRouter(

  debugLogDiagnostics: true,
  navigatorKey: _rootNavigator,
  // redirect: (BuildContext context, state) async {
  //   final List<String> guestRoutes = [
  //     indexPageRoute,
  //     authPageRoute,
  //     accountPageRoute,
  //     kycPageRoute
  //   ];
  //   // check if user has loggedIn
  //   final AuthRepository authRepository = sl<AuthRepository>();
  //   final loggedIn = await authRepository.getCurrentLoggedInUser();
  //
  //   // if user is not logged in and user is not navigating to a guest route
  //   if (!guestRoutes.contains(state.subloc) && !loggedIn) {
  //     return authPageRoute;
  //   }
  //
  //   return null;
  //
  // },
  initialLocation: indexPageRoute,
  routes: [


    /// Login page

    GoRoute(
        path: authPageRoute,
        pageBuilder: (context, state) => const NoTransitionPage(child: AuthPage())
    ),


    /// Index page route
    GoRoute(
      path: indexPageRoute,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return const NoTransitionPage(child: IndexPage());
      } ,
    ),


    /// Accounts page
    GoRoute(
      path: accountPageRoute,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return const NoTransitionPage(child: AccountPage());
      } ,

    ),

    GoRoute(
      path: kycPageRoute,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return const NoTransitionPage(child: KYCPage());
      } ,

    ),

  ],
);