import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paperless_listings/app/routing/route_constants.dart';
import 'package:paperless_listings/core/utils/functions.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_active_menu_button.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_brand_logo_widget.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_inactive_menu_button.dart';

class AccountWebTopNavBarWidget extends StatelessWidget {
  const AccountWebTopNavBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final routePath = GoRouter.of(context).location;
    final hPadding = horizontalPadding(context);

    return AppBar(
      title:  Padding(
        padding: const EdgeInsets.only(left: 40),
        child:  GestureDetector(child: const GlobalBrandLogo(), onTap: () => context.go(indexPageRoute),),
      ),
      leadingWidth: hPadding,
      centerTitle: false,
      toolbarHeight: 80,
      actions: [
        UnconstrainedBox(
          child: Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Wrap(
              // crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 20,
              children: [
                GlobalInActiveMenuButton(label: 'Home', onPressed: () => context.go(indexPageRoute),),
                routePath == accountPageRoute ? GlobalActiveMenuButton(label: 'Account', onPressed: () => context.go(accountPageRoute),) : GlobalInActiveMenuButton(label: 'Account', onPressed: () => context.go(accountPageRoute),),
                GlobalInActiveMenuButton(label: 'Blog', onPressed: () => context.go(notFoundSubPageRoute),),
                GlobalInActiveMenuButton(label: 'FAQ', onPressed: () => context.go(notFoundSubPageRoute),),
                routePath == kycPageRoute ? GlobalActiveMenuButton(label: 'KYC', onPressed: () => context.go(kycPageRoute),) : GlobalInActiveMenuButton(label: 'KYC', onPressed: () => context.go(kycPageRoute),),
                GlobalInActiveMenuButton(label: '+ Add Listings', onPressed: () => context.go(kycPageRoute),) ,
              ],
            ),
          ),
        )
      ],
    );
  }
}
