import 'package:flutter/material.dart';
import 'package:paperless_listings/core/utils/functions.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/theme.dart';

class GalleryPlaceholderWidget extends StatelessWidget {

  final int repeat;
  const GalleryPlaceholderWidget({this.repeat = 10, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hPadding = horizontalPadding(context);
    final size = sizeOfMediaQuery(context);

    final isMobile = getDeviceType(size) == DeviceScreenType.mobile;
    final width = isMobile ? size.width -  2 * hPadding : (size.width  - 2*hPadding - 40) / 3;
    final height =  (9 * width) / 16;

    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: hPadding),
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        children: [
          ...List.generate(repeat, (index) =>
              SizedBox(
                width: width,
                height: height,
                child: DecoratedBox(decoration: BoxDecoration(
                    color: themeOf(context).colorScheme.outline
                ), child:  const Center(child: CircularProgressIndicator(color: kAppRed, strokeWidth: 1,),) ,),
              )
          )
        ],
      ),
    );
  }
}
