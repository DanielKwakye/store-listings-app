import 'package:flutter/material.dart';
import 'package:paperless_listings/core/utils/functions.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../../core/utils/theme.dart';

class IndexSubHeaderWidget extends StatelessWidget {

  const IndexSubHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = sizeOfMediaQuery(context);
    final DeviceScreenType deviceType = getDeviceType(size);
    final hPadding = horizontalPadding(context);

    return ColoredBox(
      color: kAppLightGray,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 10),
        child: Row(
          mainAxisAlignment: deviceType == DeviceScreenType.mobile ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
           children:  [
              const Text('Opening now', style: TextStyle(color: kAppRed, fontWeight: FontWeight.bold),),
              const SizedBox(width: 20,),
              Column(
                mainAxisSize: MainAxisSize.min,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: const [
                   Text('Tuesday - Wednesday', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),),
                   Text('10 AM - 10 PM', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                 ],
              )
           ],
        ),
      ),
    );
  }
}
