import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:paperless_listings/app/routing/route_constants.dart';
import 'package:paperless_listings/core/utils/extensions.dart';
import 'package:paperless_listings/core/utils/functions.dart';
import 'package:paperless_listings/core/utils/theme.dart';
import 'package:paperless_listings/features/account/data/store/account_cubit.dart';
import 'package:paperless_listings/features/account/data/store/account_state.dart';
import 'package:paperless_listings/features/account/presentation/widgets/account_body_widget.dart';
import 'package:paperless_listings/features/account/presentation/widgets/account_drawer_page.dart';
import 'package:paperless_listings/features/account/presentation/widgets/account_web_top_nav_bar.dart';
import 'package:paperless_listings/features/account/presentation/widgets/request_feature_widget.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_active_menu_button.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_brand_logo_widget.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_inactive_menu_button.dart';
import 'package:paperless_listings/features/index/presentation/widgets/index_footer_widget.dart';

class AccountWebLayout extends StatelessWidget {

  const AccountWebLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final hPadding = horizontalPadding(context);
    final theme = themeOf(context);
    final size = sizeOfMediaQuery(context);
    final routePath = GoRouter.of(context).location.replaceAll('/', '');

    return Scaffold(
      appBar: const PreferredSize(preferredSize: Size.fromHeight(80),
      child: AccountWebTopNavBarWidget(),
      ),
      body: SingleChildScrollView(
        child: Column(
           children: [

             /// Web layout sub header here /////
              Container(
                width: size.width,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                color: const Color(0xffe45f90),
                child: BlocBuilder<AccountCubit, AccountState>(
                  builder: (context, state) {
                    return Text(state.menuOption.name.capitalize(), style: theme.textTheme.titleLarge?.copyWith(color: kAppWhite, fontWeight: FontWeight.bold),);
                  },
                ),
              ),

             /// Web layout main content here

             Container(
               height: size.height,
               color: theme.colorScheme.surface,
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [

                   /// Left side drawer
                   const Drawer(
                     elevation: 0,
                     backgroundColor: kAppWhite,
                     child: AccountDrawerPage(),
                   ),

                   /// Content of accounts page goes here
                   // const AccountBodyWidget(),
                   const Expanded(child: AccountBodyWidget()),

                   /// Right side drawer
                   Container(
                     margin: const EdgeInsets.only(top: 70, right: 40),
                     child: const RequestFeatureWidget(),
                   )


                 ],
               ),
             ),

             /// Footer
             const IndexFooterWidget()
           ],
        ),
      ),
    );
  }
}
