import 'package:flutter/material.dart';
import 'package:paperless_listings/core/utils/constants.dart';
import 'package:paperless_listings/core/utils/functions.dart';
import 'package:paperless_listings/features/auth/presentation/widgets/auth_form_widget.dart';

class AuthWebLayout extends StatelessWidget {
  const AuthWebLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = sizeOfMediaQuery(context);

    return Scaffold(
      body: Row(
         children: [
            SizedBox(
              height: size.height,
              width: size.width / 2,
              child: Image.asset(kNatureLoginImage, fit: BoxFit.cover,),
            ),
             SizedBox(
               height: size.height,
               width: size.width / 2,
               child:  Padding(
                 padding:  EdgeInsets.symmetric(horizontal: (1/4 * size.width/2)),
                 child: const AuthFormWidget(),
               ),
             ),
         ],
      ),
    );
  }
}
