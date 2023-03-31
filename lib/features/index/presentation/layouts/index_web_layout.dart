import 'package:flutter/material.dart';
import 'package:flutter_animator/widgets/sliding_entrances/slide_in_up.dart';
import 'package:paperless_listings/core/utils/functions.dart';
import 'package:paperless_listings/core/utils/theme.dart';
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
      floatingActionButton: ValueListenableBuilder(valueListenable: state.showScrollToTopButton, builder: (_, show, ch) {
        if(show) {
          return ch!;
        }
        return const SizedBox.shrink();
      }, child: SlideInUp(
        child: FloatingActionButton(onPressed: () {
          state.scrollController.animateTo(0.0, duration: const Duration(milliseconds: 375), curve: Curves.linear);
        },
          backgroundColor: kAppRed,
          foregroundColor: kAppWhite,
          child: const Icon(Icons.arrow_upward_sharp, color: kAppWhite,),
        ),
      ),),
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
  ValueNotifier<bool> showScrollToTopButton = ValueNotifier(false);

  @override
  Widget build(BuildContext context) => _IndexWebLayoutView(this);

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      final pixelScrolled = scrollController.position.pixels;
      if(pixelScrolled >  20) {
        if(showScrollToTopButton.value == false) {
          showScrollToTopButton.value = true;
        }
      }else {
        if(showScrollToTopButton.value == true) {
          showScrollToTopButton.value = false;
        }
      }
    });
  }


  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

}