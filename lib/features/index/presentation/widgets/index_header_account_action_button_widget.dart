import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paperless_listings/app/routing/route_constants.dart';
import 'package:paperless_listings/core/utils/functions.dart';
import 'package:paperless_listings/core/utils/theme.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_button_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class IndexHeaderAccountActionButtonWidget extends StatelessWidget {
  const IndexHeaderAccountActionButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = sizeOfMediaQuery(context);
    final DeviceScreenType deviceType = getDeviceType(size);

    return deviceType == DeviceScreenType.mobile ?
    ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: ColoredBox(
          color: kAppRed,
          child: IconButton(onPressed: () => handleCallAction(context), icon: const Icon(FeatherIcons.user, size: 18,))),
    )
        : GlobalButtonWidget(text: 'Login Now', onPressed: () => handleCallAction(context), showOutline: false,);
  }

  void handleCallAction(BuildContext context) {
    context.push(authPageRoute);
  }
}
