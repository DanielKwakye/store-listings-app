import 'package:flutter/material.dart';
import 'package:paperless_listings/features/kyc/presentation/layouts/kyc_mobile_layout.dart';
import 'package:paperless_listings/features/kyc/presentation/layouts/kyc_web_layout.dart';
import 'package:responsive_builder/responsive_builder.dart';

class KYCPage extends StatelessWidget {
  const KYCPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Construct and pass in a widget builder per screen type
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const KYCMobileLayout(),
      desktop: (BuildContext context) => const KYCWebLayout(),
    );
  }
}
