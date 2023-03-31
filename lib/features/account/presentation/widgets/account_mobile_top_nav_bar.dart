import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paperless_listings/app/routing/route_constants.dart';
import 'package:paperless_listings/core/utils/theme.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_brand_logo_widget.dart';

class AccountMobileTopNavBar extends StatelessWidget {
  const AccountMobileTopNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title:   GestureDetector(child: const GlobalBrandLogo(), onTap: () => context.go(indexPageRoute),),
      automaticallyImplyLeading: false,
      centerTitle: false,
      pinned: true,
      actions: [
        Builder(builder: (ctx) {
          return IconButton(onPressed: () {
            Scaffold.of(ctx).openDrawer();
          }, icon: const Icon(FeatherIcons.menu, size: 20, color: kAppBlack,));
        })
      ],
    );
  }
}
