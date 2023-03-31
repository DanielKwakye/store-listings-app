import 'package:flutter/material.dart';
import 'package:paperless_listings/core/utils/theme.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_border_widget.dart';
import 'package:paperless_listings/features/index/presentation/widgets/index_body_widget.dart';
import 'package:paperless_listings/features/index/presentation/widgets/index_footer_widget.dart';
import 'package:paperless_listings/features/index/presentation/widgets/index_header_widget.dart';
import 'package:paperless_listings/features/index/presentation/widgets/index_menu_bar_mobile_widget.dart';
import 'package:paperless_listings/features/index/presentation/widgets/index_sub_header_widget.dart';
import '../../../../core/utils/functions.dart';
import 'package:paperless_listings/core/utils/widget_view.dart';

class IndexMobileLayout extends StatefulWidget {

  const IndexMobileLayout({Key? key}) : super(key: key);

  @override
  IndexMobileLayoutController createState() => IndexMobileLayoutController();
}

////////////////////////////////////////////////////////
/// View is dumb, and purely declarative.
/// Easily references values on the controller and widget
////////////////////////////////////////////////////////

class _IndexMobileLayoutView extends WidgetView<IndexMobileLayout, IndexMobileLayoutController> {

  const _IndexMobileLayoutView(IndexMobileLayoutController state) : super(state);

  @override
  Widget build(BuildContext context) {

    final theme = themeOf(context);
    final hPadding = horizontalPadding(context);

    return Scaffold(
      
        body: Stack(
          children: [

            /// main Page
            NestedScrollView(
              controller: state.scrollController,
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  IndexHeaderWidget(scrollController: state.scrollController,),
                ];
              }, body: SingleChildScrollView(
                child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: const [
                      IndexSubHeaderWidget(),
                      SizedBox(height: 40,),

                      /// Body Content
                      IndexBodyWidget(),

                      SizedBox(height: 40,),

                     /// Footer
                     IndexFooterWidget()
                      // const Bor
                   ],
                ),
              ),

            ),

            /// End of main Page

            /// page Menu options
            const IndexMenuBarMobileWidget(),
            /// End of menu options

          ],
        )
    );

  }


}

////////////////////////////////////////////////////////
/// Controller holds state, and all business logic
////////////////////////////////////////////////////////

class IndexMobileLayoutController extends State<IndexMobileLayout> {

  late ScrollController scrollController;

  @override
  Widget build(BuildContext context) => _IndexMobileLayoutView(this);

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }


  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

}
