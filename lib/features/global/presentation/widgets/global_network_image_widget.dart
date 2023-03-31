import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paperless_listings/core/utils/functions.dart';
import 'package:paperless_listings/core/utils/theme.dart';
import 'package:responsive_builder/responsive_builder.dart';

class GlobalNetworkImageWidget extends StatelessWidget {

  final String imageUrl;
  final BoxFit? fit;
  const GlobalNetworkImageWidget({
    required this.imageUrl,
    this.fit,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final hPadding = horizontalPadding(context);
    final size = sizeOfMediaQuery(context);
    final isMobile = getDeviceType(size) == DeviceScreenType.mobile;
    final width = isMobile ? size.width - hPadding : (size.width / 3) - hPadding;
    final height = isMobile ? width : (9 * width) / 16;

    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      fadeInCurve: Curves.easeIn,
      cacheKey: imageUrl,
      memCacheWidth: width.toInt(),
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          SizedBox(
            width: width,
            height: height,
            child: DecoratedBox(decoration: BoxDecoration(
                color: themeOf(context).colorScheme.outline
            ), child:  const Center(child: CircularProgressIndicator(color: kAppRed, strokeWidth: 1,),) ,),
          ),
      errorWidget: (context, url, error) => const Center(child: Icon(Icons.error_outline),),
    );
  }
}
