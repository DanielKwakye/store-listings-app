import 'package:flutter/material.dart';
import 'package:paperless_listings/core/utils/constants.dart';
import 'package:paperless_listings/core/utils/functions.dart';
import 'package:paperless_listings/core/utils/theme.dart';

class GlobalBrandLogo extends StatelessWidget {

  final bool showLogo;
  final bool alternateColors;

  const GlobalBrandLogo({
    this.showLogo = true,
    this.alternateColors = false,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = themeOf(context);
    final style = theme.textTheme.titleMedium?.copyWith(color: kAppRed, fontWeight: FontWeight.bold);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if(showLogo) ... {
          SizedBox(width: 30,  height: 30, child: Image.asset(kLogoTransparent),),
          const SizedBox(width: 10,),
        },
        RichText(text: TextSpan(
            style: style,
            text: '', children:  [
              TextSpan(text: 'Paperless ' , style: alternateColors ? style?.copyWith(color: theme.colorScheme.onBackground) : style),
              TextSpan(text: 'Listings' , style: style)
            ]))

      ],
    );
  }
}
