import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:paperless_listings/app/routing/route_constants.dart';
import 'package:paperless_listings/core/utils/enums.dart';
import 'package:paperless_listings/core/utils/functions.dart';
import 'package:paperless_listings/core/utils/theme.dart';
import 'package:paperless_listings/core/utils/widget_view.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_brand_logo_widget.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_button_widget.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_child_animator_widget.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_text_field_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AuthFormWidget extends StatefulWidget {

  const AuthFormWidget({Key? key}) : super(key: key);

  @override
  AuthFormWidgetController createState() => AuthFormWidgetController();
}

////////////////////////////////////////////////////////
/// View is dumb, and purely declarative.
/// Easily references values on the controller and widget
////////////////////////////////////////////////////////

class _AuthFormWidgetView extends WidgetView<AuthFormWidget, AuthFormWidgetController> {

  const _AuthFormWidgetView(AuthFormWidgetController state) : super(state);

  @override
  Widget build(BuildContext context) {

    final size = sizeOfMediaQuery(context);
    final isMobile = getDeviceType(size) == DeviceScreenType.mobile;
    return Scaffold(
        body: Form(child: SingleChildScrollView(
          child: GlobalChildAnimatorWidget(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: isMobile ? 10 : size.height / 10,),
                const GlobalBrandLogo(),
                SizedBox(height: isMobile ? 20 : 40,),
                GlobalTextFieldWidget(label: isMobile ? '' : 'Email', placeHolder: 'Enter email'),
                SizedBox(height: isMobile ? 0 : 20,),
                GlobalTextFieldWidget(label: isMobile ? '' : 'Password', placeHolder: 'Enter password'),
                // const SizedBox(height: 20,),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(padding: EdgeInsets.symmetric(vertical: 25), child: Text('Forgot password', style: TextStyle(color: kAppRed, fontWeight: FontWeight.bold),),)),
                GlobalButtonWidget(text: 'Login', onPressed: () {
                  context.go(accountPageRoute);
                }, appearance: Appearance.primary, expand: true, showOutline: false,),

                SizedBox(height: isMobile ? 20 : 40,),
                const Align(
                  alignment: Alignment.topCenter,
                  child: Text('OR'),
                ),
                SizedBox(height: isMobile ? 20 : 40,),
                GlobalButtonWidget(text: 'Continue with apple', onPressed: () {
                  context.go(accountPageRoute);
                }, appearance: Appearance.dark, expand: true, showOutline: false,
                  icon: const Align(alignment: Alignment.topLeft,
                    child: Icon(FontAwesomeIcons.apple, size: 18, color: kAppWhite,),
                  ),
                ),

                const SizedBox(height: 20,),
                GlobalButtonWidget(text: 'Continue with facebook', onPressed: () {
                  context.go(accountPageRoute);
                }, backgroundColor: const Color(0xff0278ff), textColor: kAppWhite, expand: true, showOutline: false,
                  icon: const Align(alignment: Alignment.topLeft,
                    child: Icon(FontAwesomeIcons.facebook, size: 18, color: kAppWhite,),
                  ),
                ),
                const SizedBox(height: 20,),
                GlobalButtonWidget(text: 'Continue with twitter', onPressed: () {
                  context.go(accountPageRoute);
                }, backgroundColor:  kAppBlue, textColor: kAppWhite, expand: true, showOutline: false,
                  icon: const Align(alignment: Alignment.topLeft,
                    child: Icon(FontAwesomeIcons.twitter, size: 18, color: kAppWhite,),
                  ),
                ),

                const SizedBox(height: 20,),

                TextButton(onPressed: (){
                  context.go(accountPageRoute);
                }, child: RichText(
                  text: const TextSpan(text: 'Do you have account? ',
                      style: TextStyle(color: kAppFaintBlack),
                      children: [
                        TextSpan(text: 'Join free today', style: TextStyle(color: kAppRed))
                      ]),
                ))

              ],
            ),
          ),
        ))
    );

  }

}

////////////////////////////////////////////////////////
/// Controller holds state, and all business logic
////////////////////////////////////////////////////////

class AuthFormWidgetController extends State<AuthFormWidget> {


  @override
  Widget build(BuildContext context) => _AuthFormWidgetView(this);

  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
  }

}
