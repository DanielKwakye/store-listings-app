import 'package:flutter/material.dart';
import 'package:paperless_listings/core/utils/enums.dart';
import 'package:paperless_listings/core/utils/functions.dart';
import 'package:paperless_listings/core/utils/theme.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_button_widget.dart';
import 'package:paperless_listings/features/plugins/data/models/plugin_model.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PluginItemWidget extends StatelessWidget {

  final PluginModel pluginModel;

  const PluginItemWidget({
    required this.pluginModel,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = sizeOfMediaQuery(context);
    final isMobile = getDeviceType(size) == DeviceScreenType.mobile;
    final theme = themeOf(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: isMobile ? theme.colorScheme.surface : kAppWhite,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 15, right: 15, top: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.asset(pluginModel.icon, fit: BoxFit.cover,),
              ),
              title: Text(pluginModel.title),
              subtitle: Text(pluginModel.subTitle, style: const TextStyle(fontSize: 12),),
              contentPadding: const EdgeInsets.only(bottom: 5),
              trailing: isMobile ? null : (pluginModel.enabled ? buttonToDisable() : buttonToEnable()),
            ),
            if(isMobile) ... {
              if(pluginModel.enabled) ... {
                buttonToDisable()
              }else ... {
                buttonToEnable()
              }
            }
          ],
        ),
      ),
    );
  }

  Widget buttonToDisable() {
    return GlobalButtonWidget(text: 'Enable', appearance: Appearance.primary, onPressed: () {
    }, showOutline: false,);
  }

  Widget buttonToEnable() {
    return GlobalButtonWidget(text: 'Disable', appearance: Appearance.clean, onPressed: () {
    },);

  }


}
