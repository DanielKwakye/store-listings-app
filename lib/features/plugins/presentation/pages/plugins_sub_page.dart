import 'package:flutter/material.dart';
import 'package:paperless_listings/core/utils/functions.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_border_widget.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_child_animator_widget.dart';
import 'package:paperless_listings/features/plugins/data/plugin_constants.dart';
import 'package:paperless_listings/features/plugins/presentation/widgets/plugin_item_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PluginsSubPage extends StatelessWidget {

  const PluginsSubPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final generalPlugins = plugins.where((element) => element.category == "general");
    final uniquePlugins = plugins.where((element) => element.category == "unique");
    final theme = themeOf(context);
    final size = sizeOfMediaQuery(context);
    final hPadding = horizontalPadding(context);
    final isMobile = getDeviceType(size) == DeviceScreenType.mobile;

    return GlobalChildAnimatorWidget(
      child: SingleChildScrollView(
        physics: isMobile ? const NeverScrollableScrollPhysics() : null,
        child: Padding(
          padding: EdgeInsets.only(top: isMobile ? 20 : 40, left: isMobile ? hPadding : 40,right: isMobile ?  hPadding : 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('General', style: theme.textTheme.titleMedium,),
              const GlobalBorderWidget(paddingTop: 20, paddingBottom: 20,),
              ...generalPlugins.map((plugin) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: PluginItemWidget(pluginModel: plugin),
              )).toList(),
              const SizedBox(height: 50,),
              Text('Unique', style: theme.textTheme.titleMedium,),
              const GlobalBorderWidget(paddingTop: 20, paddingBottom: 20,),
              ...uniquePlugins.map((plugin) => PluginItemWidget(pluginModel: plugin)).toList(),
            ],
          ),
        ),
      ),
    );
  }
}


