import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:paperless_listings/core/utils/enums.dart';
import 'package:paperless_listings/features/faq/presentation/pages/faq_sub_page.dart';
import 'package:paperless_listings/features/gallery/presentation/pages/gallery_sub_page.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_error_widget.dart';
import 'package:paperless_listings/features/index/data/store/index_cubit.dart';
import 'package:paperless_listings/features/index/data/store/index_state.dart';

class IndexBodyWidget extends StatelessWidget {
  const IndexBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexCubit, IndexState>(
      builder: (context, state) {
        if(state.menuOption == IndexMenuOption.gallery) {
          return const GallerySubPage();
        }
        if(state.menuOption == IndexMenuOption.faq) {
          return const FAQSubPage();
        }
        return SizedBox(
          width: 500,
          height: 500,
          child: Lottie.network("https://assets1.lottiefiles.com/packages/lf20_g4wqji2g.json"),
        );
      },
    );
  }
}
