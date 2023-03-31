import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paperless_listings/core/utils/functions.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_child_animator_widget.dart';
import 'package:paperless_listings/features/index/presentation/widgets/index_header_call_action_button_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/theme.dart';
import 'package:paperless_listings/core/utils/widget_view.dart';

import 'index_header_account_action_button_widget.dart';

class IndexHeaderWidget extends StatefulWidget {

  final ScrollController scrollController;
  const IndexHeaderWidget({required this.scrollController, Key? key}) : super(key: key);

  @override
  IndexHeaderWidgetController createState() => IndexHeaderWidgetController();
}

////////////////////////////////////////////////////////
/// View is dumb, and purely declarative.
/// Easily references values on the controller and widget
////////////////////////////////////////////////////////

class _IndexHeaderWidgetView extends WidgetView<IndexHeaderWidget, IndexHeaderWidgetController> {

  const _IndexHeaderWidgetView(IndexHeaderWidgetController state) : super(state);

  @override
  Widget build(BuildContext context) {

    final theme = themeOf(context);
    final size = sizeOfMediaQuery(context);
    final DeviceScreenType deviceType = getDeviceType(size);
    final isMobile = deviceType == DeviceScreenType.mobile;
    final double expandedHeight =  deviceType == DeviceScreenType.mobile ?  (size.height * 0.4) : size.height;
    state.expandedHeight = expandedHeight;
    final hPadding = horizontalPadding(context);

    return ValueListenableBuilder<bool>(valueListenable: state.scrolledBeyondToolbar, builder: (_, scrolledBeyondToolbar, __) {
      return SliverAppBar(
        title:  Padding(
          padding:  EdgeInsets.only(left: deviceType == DeviceScreenType.mobile ? 0 : hPadding / 2),
          child: Text('La Brasserie', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.normal, color: scrolledBeyondToolbar ? kAppBlack : kAppWhite)),
        ),
        centerTitle: false,
        expandedHeight: expandedHeight,
        pinned: true,
        floating: true,
        elevation: 1,
        toolbarHeight: isMobile ? kToolbarHeight : state.toolBarHeight,
        flexibleSpace: Stack(
          children: [
            FlexibleSpaceBar(
              background: Stack(
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: Image.asset(kHeaderBackground, fit: BoxFit.cover,),
                  ),
                  Container(color: Colors.black.withOpacity(0.5),),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: GlobalChildAnimatorWidget(
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                           children: [
                             Text('Enjoy a healthy delicious meal', textAlign: TextAlign.center, style: GoogleFonts.greatVibes(fontWeight: FontWeight.normal, color: kAppWhite, fontSize:  deviceType == DeviceScreenType.mobile ? 30 : 70)),
                             const SizedBox(height: 10,),
                             Text('We are an elegant restaurant with a vast range of African food from Cameroon, Nigeria, Kenya. Visit us and we promising you a very tasty meal', textAlign: TextAlign.center, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.normal, color: kAppWhite, fontSize:  deviceType == DeviceScreenType.mobile ? 14 : 16)),
                           ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        actions: [
          const UnconstrainedBox(
            child: IndexHeaderCallActionButtonWidget(),
          ),
          SizedBox(width: deviceType == DeviceScreenType.mobile ? 10 : 20,),
          const UnconstrainedBox(child: IndexHeaderAccountActionButtonWidget(),),
          SizedBox(width: deviceType == DeviceScreenType.mobile ? 20  : hPadding / 2,)
        ],
      );
    });
    
  }

}

////////////////////////////////////////////////////////
/// Controller holds state, and all business logic
////////////////////////////////////////////////////////

class IndexHeaderWidgetController extends State<IndexHeaderWidget> {


  final double toolBarHeight = 80;
  double expandedHeight = 100;
  ValueNotifier<bool> scrolledBeyondToolbar = ValueNotifier(false);

  @override
  Widget build(BuildContext context) => _IndexHeaderWidgetView(this);

  @override
  void initState() {
    super.initState();

    widget.scrollController.addListener(() {
      final pixels = widget.scrollController.offset;

      // checking if its not already true to avoid unnecessary rebuilds
      if(pixels >= (expandedHeight - 100) ) {
        scrolledBeyondToolbar.value = true;
      }else {
        scrolledBeyondToolbar.value = false;
      }
    });
  }


  @override
  void dispose() {
    super.dispose();
  }

}
