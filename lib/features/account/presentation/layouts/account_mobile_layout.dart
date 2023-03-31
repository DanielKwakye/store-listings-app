import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:paperless_listings/app/routing/route_constants.dart';
import 'package:paperless_listings/core/utils/extensions.dart';
import 'package:paperless_listings/core/utils/functions.dart';
import 'package:paperless_listings/core/utils/sliver_persistent_header_delegate_impl.dart';
import 'package:paperless_listings/core/utils/theme.dart';
import 'package:paperless_listings/features/account/data/store/account_cubit.dart';
import 'package:paperless_listings/features/account/data/store/account_state.dart';
import 'package:paperless_listings/features/account/presentation/widgets/account_body_widget.dart';
import 'package:paperless_listings/features/account/presentation/widgets/account_drawer_page.dart';
import 'package:paperless_listings/features/account/presentation/widgets/account_mobile_top_nav_bar.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_border_widget.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_brand_logo_widget.dart';
import 'package:paperless_listings/features/plugins/data/plugin_constants.dart';
import 'package:paperless_listings/features/plugins/presentation/widgets/plugin_item_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AccountMobileLayout extends StatelessWidget {

  const AccountMobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final routePath = GoRouter.of(context).location.replaceAll('/', '');
    final theme = themeOf(context);
    final size = sizeOfMediaQuery(context);


    return Scaffold(
      drawer: Drawer(
        child: AccountDrawerPage(onItemTap: (option) {
          context.pop();
        },),
      ),
      body: NestedScrollView(headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          /// Header section of account -------
          const AccountMobileTopNavBar(),

          /// Breadcrumb
          SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Wrap(
                  spacing: 10,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Text('Account'),
                    Icon(Icons.arrow_forward_ios, color: theme.colorScheme.onBackground, size: 14,),
                    BlocBuilder<AccountCubit, AccountState>(
                      builder: (context, state) {
                        return Text(state.menuOption.name.capitalize());
                      },
                    ),
                  ],
                ),
              ),
          )
        ];
      }, body:
          /// Content of accounts page goes here
      const AccountBodyWidget()
      )
    );

  }
}
