import 'package:flutter/material.dart';
import 'package:paperless_listings/core/utils/functions.dart';
import 'package:paperless_listings/features/index/presentation/widgets/index_body_widget.dart';
import 'package:paperless_listings/features/index/presentation/widgets/index_footer_widget.dart';
import 'package:paperless_listings/features/index/presentation/widgets/index_header_widget.dart';
import 'package:paperless_listings/core/utils/widget_view.dart';
import 'package:paperless_listings/features/index/presentation/widgets/index_menu_bar_web_widget.dart';
import 'package:paperless_listings/features/index/presentation/widgets/index_sub_header_widget.dart';


class IndexWebLayout extends StatefulWidget {

  const IndexWebLayout({Key? key}) : super(key: key);

  @override
  IndexWebLayoutController createState() => IndexWebLayoutController();
}

////////////////////////////////////////////////////////
/// View is dumb, and purely declarative.
/// Easily references values on the controller and widget
////////////////////////////////////////////////////////

class _IndexWebLayoutView extends WidgetView<IndexWebLayout, IndexWebLayoutController> {

  const _IndexWebLayoutView(IndexWebLayoutController state) : super(state);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: NestedScrollView(
          controller: state.scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            /// Header
             IndexHeaderWidget(scrollController: state.scrollController,),
          ];
        }, body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisSize: MainAxisSize.min,
             children: const [
               IndexSubHeaderWidget(),
               SizedBox(height: 40,),
                /// Menu Options
               IndexMenuBarWebWidget(),
               /// End of menu options

               SizedBox(height: 40,),

               // /// Body Content
               IndexBodyWidget(),

               SizedBox(height: 40,),

               /// Footer
               IndexFooterWidget()

             ],
          ),
        ),

        )
    );

  }

}

////////////////////////////////////////////////////////
/// Controller holds state, and all business logic
////////////////////////////////////////////////////////

class IndexWebLayoutController extends State<IndexWebLayout> {

  late ScrollController scrollController;

  @override
  Widget build(BuildContext context) => _IndexWebLayoutView(this);

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