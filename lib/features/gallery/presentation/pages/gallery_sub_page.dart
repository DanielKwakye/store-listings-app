import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paperless_listings/core/utils/enums.dart';
import 'package:paperless_listings/core/utils/functions.dart';
import 'package:paperless_listings/core/utils/theme.dart';
import 'package:paperless_listings/core/utils/widget_view.dart';
import 'package:paperless_listings/features/gallery/data/store/gallery_cubit.dart';
import 'package:paperless_listings/features/gallery/data/store/gallery_state.dart';
import 'package:paperless_listings/features/gallery/presentation/widgets/gallery_placeholder_widget.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_border_widget.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_child_animator_widget.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_error_widget.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_network_image_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class GallerySubPage extends StatefulWidget {

  const GallerySubPage({Key? key}) : super(key: key);

  @override
  GallerySubPageController createState() => GallerySubPageController();
}

////////////////////////////////////////////////////////
/// View is dumb, and purely declarative.
/// Easily references values on the controller and widget
////////////////////////////////////////////////////////

class _GallerySubPageView extends WidgetView<GallerySubPage, GallerySubPageController> {

  const _GallerySubPageView(GallerySubPageController state) : super(state);

  @override
  Widget build(BuildContext context) {

    final hPadding = horizontalPadding(context);
    final size = sizeOfMediaQuery(context);
    final isMobile = getDeviceType(size) == DeviceScreenType.mobile;
    final width = isMobile ? size.width -  2 * hPadding : (size.width  - 2*hPadding - 40) / 3;
    final height = isMobile ? width : (9 * width) / 16;
    final theme = themeOf(context);

    return BlocBuilder<GalleryCubit, GalleryState>(
      builder: (context, state) {

        if(state.status == BlocStatus.fetchAnimalsInProgress){
          return const GalleryPlaceholderWidget();
        }

        if(state.status == BlocStatus.fetchAnimalsFailed){
          return  GlobalErrorWidget(message: state.message,);
        }

        /// Returned animals data displays here
        if(state.status == BlocStatus.fetchAnimalsSuccessful){
          return GlobalChildAnimatorWidget(
            child: Container(
              width: size.width,
              padding: EdgeInsets.symmetric(horizontal: hPadding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text('Gallery', style: theme.textTheme.titleMedium?.copyWith(color: kAppRed, fontWeight: FontWeight.bold),),
                  const GlobalBorderWidget(paddingTop: 10, paddingBottom: 10,),

                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: state.animals.map((item) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(isMobile ? 8 : 0),
                        child: SizedBox(
                          width: width,
                          height: height,
                          child: GlobalNetworkImageWidget(imageUrl: item.url ?? '', fit: BoxFit.cover,),
                        ),
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );


  }

}

////////////////////////////////////////////////////////
/// Controller holds state, and all business logic
////////////////////////////////////////////////////////

class GallerySubPageController extends State<GallerySubPage> {

  late GalleryCubit galleryCubit;
  @override
  Widget build(BuildContext context) => _GallerySubPageView(this);

  @override
  void initState() {
    super.initState();
    galleryCubit = context.read<GalleryCubit>();
    galleryCubit.fetchAnimals();
  }


  @override
  void dispose() {
    super.dispose();
  }

}