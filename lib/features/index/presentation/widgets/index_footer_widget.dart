import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:paperless_listings/core/utils/constants.dart';
import 'package:paperless_listings/core/utils/functions.dart';
import 'package:paperless_listings/core/utils/theme.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_brand_logo_widget.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_text_field_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class IndexFooterWidget extends StatelessWidget {
  const IndexFooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final hPadding = horizontalPadding(context);
    final size = sizeOfMediaQuery(context);
    final isMobile = getDeviceType(size) == DeviceScreenType.mobile;
    final width = isMobile ? size.width -  2 * hPadding : (size.width  - 2*hPadding - (100 * 2)) / 3;

    return Container(
      width: size.width,
      decoration: const BoxDecoration(
        color: Color(0xff322b2b),
      ),
      padding: EdgeInsets.only(
        left: hPadding,
        right: hPadding,
        top: isMobile ? 20 : 40,
        bottom: 40
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
         children: [
           Wrap(
             spacing: 100,
             runSpacing: 20,
             children: [
               SizedBox(width: width,
                 child: const _FooterBrandingSection(),
               ),
               SizedBox(width: width,
                 child: Align(
                   alignment: isMobile ? Alignment.topLeft : Alignment.topCenter,
                   child: const _FooterServicesSection(),
                 ),
               ),
               SizedBox(width: width,
                 child:  Align(
                     alignment: isMobile ? Alignment.topLeft : Alignment.topCenter,
                     child: const  _FooterAboutSection()),
               ),
             ],
           ),

           const SizedBox(height: 50,),
           Wrap(
             spacing: 100,
             runSpacing: 20,
             children: [
               SizedBox(width: width,
                 child: const _FooterSubscribeSection(),
               ),
               SizedBox(width: width,
                 child:  Align(
                     alignment: isMobile ? Alignment.topLeft :Alignment.topCenter,
                     child: const _FooterMobileLinksSection(),
                 ),
               ),
               SizedBox(width: width,
                 child: Align(
                   alignment: isMobile ? Alignment.topLeft : Alignment.topCenter,
                   child: const _FooterSocialLinksSection(),
                 ),
               ),
             ],
           ),
         ],
      )
    );
  }
}

/// Branding section of the footer
class _FooterBrandingSection extends StatelessWidget {
  const _FooterBrandingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = themeOf(context);
    return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       mainAxisSize: MainAxisSize.min,
       children: [
         GlobalBrandLogo(),
         const SizedBox(height: 10,),
         Text('Copyright @ 2012. All rights reserved', style: theme.textTheme.bodySmall?.copyWith(color: kAppWhite),)
       ],
    );
  }
}


/// Services section of the footer
class _FooterServicesSection extends StatelessWidget {
  const _FooterServicesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = themeOf(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text('Services', style: theme.textTheme.titleMedium?.copyWith(color: kAppRed, fontWeight: FontWeight.bold),),
         const SizedBox(height: 20,),
         Text('Home ', style: theme.textTheme.bodySmall?.copyWith(color: kAppWhite),),
         const SizedBox(height: 20,),
         Text('Explore  ', style: theme.textTheme.bodySmall?.copyWith(color: kAppWhite),),
         const SizedBox(height: 20,),
         Text('FAQ  ', style: theme.textTheme.bodySmall?.copyWith(color: kAppWhite),),
         const SizedBox(height: 20,),
         Text('Blog  ', style: theme.textTheme.bodySmall?.copyWith(color: kAppWhite),)
       ],
    );
  }
}


/// About section of the footer
class _FooterAboutSection extends StatelessWidget {
  const _FooterAboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = themeOf(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('About', style: theme.textTheme.titleMedium?.copyWith(color: kAppRed, fontWeight: FontWeight.bold),),
        const SizedBox(height: 20,),
        Text('About Us', style: theme.textTheme.bodySmall?.copyWith(color: kAppWhite),),
        const SizedBox(height: 20,),
        Text('Contact Us', style: theme.textTheme.bodySmall?.copyWith(color: kAppWhite)),
        const SizedBox(height: 20,),
        Text('Term of Use', style: theme.textTheme.bodySmall?.copyWith(color: kAppWhite),),
        const SizedBox(height: 20,),
        Text('Privacy policy', style: theme.textTheme.bodySmall?.copyWith(color: kAppWhite),),
      ],
    );
  }
}

/// subscribe to news letter section of the footer
class _FooterSubscribeSection extends StatelessWidget {
  const _FooterSubscribeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = themeOf(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        GlobalTextFieldWidget(label: 'Subscribe to our news letter', placeHolder: 'Email address', labelColor: kAppWhite, placeHolderColor: kAppWhite,)
      ],
    );
  }
}


/// mobile links section of the footer
class _FooterMobileLinksSection extends StatelessWidget {
  const _FooterMobileLinksSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = themeOf(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        spacing: 10,
        children: [
          Image.asset(kIOSDownloadLinkImage,scale: 1.5,),
          Image.asset(kIOSDownloadLinkImage,scale: 1.5,),
          // Image.asset(kAndroidDownloadLinkImage, scale: 1.5,)
        ],
      ),
    );
  }
}

/// mobile links section of the footer
class _FooterSocialLinksSection extends StatelessWidget {
  const _FooterSocialLinksSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = themeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20,),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(FontAwesomeIcons.facebook, color: kAppWhite, size: 20,),
            SizedBox(width: 20,),
            Icon(FontAwesomeIcons.instagram, color: kAppWhite, size: 20,),
            SizedBox(width: 20,),
            Icon(FontAwesomeIcons.twitter, color: kAppWhite, size: 20,)
          ],
        )
      ],
    );
  }
}


