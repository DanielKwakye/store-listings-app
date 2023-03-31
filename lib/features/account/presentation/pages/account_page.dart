import 'package:flutter/material.dart';
import 'package:paperless_listings/features/account/presentation/layouts/account_mobile_layout.dart';
import 'package:paperless_listings/features/account/presentation/layouts/account_web_layout.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AccountPage extends StatelessWidget {

  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) =>  const AccountMobileLayout(),
      desktop: (BuildContext context) =>  const AccountWebLayout(),
    );
  }
}
