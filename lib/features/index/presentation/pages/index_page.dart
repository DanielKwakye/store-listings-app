import 'package:flutter/material.dart';
import 'package:paperless_listings/features/index/presentation/layouts/index_web_layout.dart';
import 'package:paperless_listings/features/index/presentation/layouts/index_mobile_layout.dart';
import 'package:responsive_builder/responsive_builder.dart';


class IndexPage extends StatelessWidget {

  const IndexPage({required, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Construct and pass in a widget builder per screen type
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => IndexMobileLayout(),
      desktop: (BuildContext context) => const IndexWebLayout(),
    );
  }
}
