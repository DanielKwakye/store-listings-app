import 'package:flutter/material.dart';
import 'package:paperless_listings/core/utils/functions.dart';
import 'package:paperless_listings/features/account/presentation/widgets/account_web_top_nav_bar.dart';
import 'package:paperless_listings/features/index/presentation/widgets/index_footer_widget.dart';
import 'package:paperless_listings/features/kyc/presentation/widgets/kyc_form_widget.dart';

class KYCWebLayout extends StatelessWidget {
  const KYCWebLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = sizeOfMediaQuery(context);

    return Scaffold(
      appBar: const PreferredSize(preferredSize: Size.fromHeight(80),
        child: AccountWebTopNavBarWidget(),
      ),
      body: SingleChildScrollView(
        child: Column(
           children: [
              SizedBox(height: size.height,
                width: size.width / 3,
                child: const Center(
                  child: KYCFormWidget(),
                ),
              ),
              const IndexFooterWidget()
           ],
        ),
      ),
    );
  }
}

