import 'package:flutter/material.dart';
import 'package:paperless_listings/core/utils/functions.dart';
import 'package:paperless_listings/features/auth/presentation/widgets/auth_form_widget.dart';

class AuthMobileLayout extends StatelessWidget {
  const AuthMobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hPadding = horizontalPadding(context);

    return Scaffold(
      appBar: AppBar(backgroundColor: themeOf(context).colorScheme.background, elevation: 0,),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: hPadding),
        child: const AuthFormWidget(),
      ),
    );
  }
}
