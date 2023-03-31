import 'package:flutter/material.dart';
import 'package:paperless_listings/features/auth/presentation/pages/layouts/auth_mobile_layout.dart';
import 'package:paperless_listings/features/auth/presentation/pages/layouts/auth_web_layout.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const AuthMobileLayout(),
      desktop: (BuildContext context) => const AuthWebLayout(),
    );
  }
}
