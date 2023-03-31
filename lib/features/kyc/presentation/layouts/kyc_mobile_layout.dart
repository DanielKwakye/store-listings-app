import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paperless_listings/core/utils/functions.dart';
import 'package:paperless_listings/features/account/presentation/widgets/account_drawer_page.dart';
import 'package:paperless_listings/features/account/presentation/widgets/account_mobile_top_nav_bar.dart';
import 'package:paperless_listings/features/kyc/presentation/widgets/kyc_form_widget.dart';

class KYCMobileLayout extends StatelessWidget {
  const KYCMobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final theme = themeOf(context);
    final size = sizeOfMediaQuery(context);
    final hPadding = horizontalPadding(context);

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

          ];
        }, body:
        /// Content of accounts page goes here
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: hPadding, right: hPadding, top: 20, bottom: 40),
            child: const KYCFormWidget(),
            ),
        )
        )
    );
  }
}
