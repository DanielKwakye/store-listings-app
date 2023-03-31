import 'package:flutter/material.dart';
import 'package:paperless_listings/core/utils/functions.dart';
import 'package:paperless_listings/core/utils/theme.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_border_widget.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_child_animator_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FAQSubPage extends StatefulWidget {
  const FAQSubPage({Key? key}) : super(key: key);

  @override
  State<FAQSubPage> createState() => _FAQSubPageState();
}

class _FAQSubPageState extends State<FAQSubPage> {

  int _customTileExpandedIndex = -1;

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    final size = sizeOfMediaQuery(context);
    final isMobile = getDeviceType(size) == DeviceScreenType.mobile;
    final hPadding = horizontalPadding(context);

    return GlobalChildAnimatorWidget(child: Padding(
      padding: EdgeInsets.symmetric(horizontal: hPadding),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children:  [
          Text(isMobile ? 'FAQ' : 'Frequently asked questions', style: theme.textTheme.titleMedium?.copyWith(color: kAppRed, fontWeight: FontWeight.bold),),
          const GlobalBorderWidget(paddingTop: 10, paddingBottom: 10,),
          ExpansionTile(
            trailing: Icon(
              _customTileExpandedIndex == 0
                  ? Icons.cancel:
              Icons.add ,
              color: kAppRed,
            ),
            tilePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            childrenPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            collapsedBackgroundColor: theme.colorScheme.surface,
            leading: const Text('01', style: TextStyle(fontWeight: FontWeight.bold),),
            title:  const Text('Do they accept mobile money payments?', style: TextStyle(fontWeight: FontWeight.bold)),
            children: const <Widget> [
              ListTile(title: Text("Yes, La Brasserie offers takeout services")),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() => _customTileExpandedIndex = _customTileExpandedIndex = _customTileExpandedIndex == 0 ? -1 : 0);
            },
          ),
          ExpansionTile(
            trailing: Icon(
              _customTileExpandedIndex == 1
                  ? Icons.cancel:
              Icons.add ,
              color: kAppRed,
            ),
            tilePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            childrenPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            collapsedBackgroundColor: theme.colorScheme.surface,
            leading: const Text('01', style: TextStyle(fontWeight: FontWeight.bold),),
            title:  const Text('Do they accept mobile money payments?', style: TextStyle(fontWeight: FontWeight.bold)),
            children: const <Widget> [
              ListTile(title: Text("Yes, La Brasserie accepts all kind of mobile money payments")),
            ],

            onExpansionChanged: (bool expanded) {
              setState(() => _customTileExpandedIndex = _customTileExpandedIndex = _customTileExpandedIndex == 1 ? -1 : 1);
            },

          ),
          ExpansionTile(
            trailing: Icon(
              _customTileExpandedIndex == 2
                  ? Icons.cancel:
              Icons.add ,
              color: kAppRed,
            ),
            tilePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            childrenPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            collapsedBackgroundColor: theme.colorScheme.surface,
            leading: const Text('01', style: TextStyle(fontWeight: FontWeight.bold),),
            title:  const Text('Do they accept mobile money payments?', style: TextStyle(fontWeight: FontWeight.bold)),
            children: const <Widget> [
              ListTile(title: Text("Yes, La Brasserie accepts all kind of mobile money payments")),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() => _customTileExpandedIndex = _customTileExpandedIndex == 2 ? -1 :  2);
            },
          ),
          ExpansionTile(
            trailing: Icon(
              _customTileExpandedIndex == 3
                  ? Icons.cancel:
              Icons.add ,
              color: kAppRed,
            ),
            tilePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            childrenPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            collapsedBackgroundColor: theme.colorScheme.surface,
            leading: const Text('01', style: TextStyle(fontWeight: FontWeight.bold),),
            title:  const Text('Do they accept mobile money payments?', style: TextStyle(fontWeight: FontWeight.bold)),
            children: const <Widget> [
              ListTile(title: Text("Yes, La Brasserie accepts all kind of mobile money payments")),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() => _customTileExpandedIndex = _customTileExpandedIndex = _customTileExpandedIndex == 3 ? -1 : 3);
            },
          ),
          ExpansionTile(
            trailing: Icon(
              _customTileExpandedIndex == 4
                  ? Icons.cancel:
              Icons.add ,
              color: kAppRed,
            ),
            tilePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            childrenPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            collapsedBackgroundColor: theme.colorScheme.surface,
            leading: const Text('01', style: TextStyle(fontWeight: FontWeight.bold),),
            title:  const Text('Do they accept mobile money payments?', style: TextStyle(fontWeight: FontWeight.bold)),
            children: const <Widget> [
              ListTile(title: Text("Yes, La Brasserie accepts all kind of mobile money payments")),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() => _customTileExpandedIndex = _customTileExpandedIndex = _customTileExpandedIndex == 4 ? -1 :4);
            },
          ),
        ],
      ),
    ));
  }
}
