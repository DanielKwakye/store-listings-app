import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:paperless_listings/app/routing/route_constants.dart';
import 'package:paperless_listings/core/utils/enums.dart';
import 'package:paperless_listings/core/utils/theme.dart';
import 'package:paperless_listings/features/gallery/presentation/pages/gallery_sub_page.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_active_menu_button.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_inactive_menu_button.dart';
import 'package:paperless_listings/features/index/data/store/index_cubit.dart';
import 'package:paperless_listings/features/index/data/store/index_state.dart';

class IndexMenuBarWebWidget extends StatelessWidget {
  const IndexMenuBarWebWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return BlocSelector<IndexCubit, IndexState, IndexMenuOption>(
      selector: (state){
        return state.menuOption;
      },
      builder: (context, activeMenu) {
        return Wrap(
            spacing: 20, // to apply margin in the main axis of the wrap
            runSpacing: 20, // to apply margin in the cross axis of the wrap
            children:  <Widget> [
              activeMenu == IndexMenuOption.about ? GlobalActiveMenuButton(label: 'About', onPressed: () {} ) : GlobalInActiveMenuButton(label: 'About', onPressed: () => context.read<IndexCubit>().activateMenu(option: IndexMenuOption.about),),

              activeMenu == IndexMenuOption.menu ?  GlobalActiveMenuButton(label: 'Our menu', onPressed: () {},) : GlobalInActiveMenuButton(label: 'Our menu', onPressed: () => context.read<IndexCubit>().activateMenu(option: IndexMenuOption.menu),),

              activeMenu == IndexMenuOption.features ? GlobalActiveMenuButton(label: 'Features', onPressed: () {},) : GlobalInActiveMenuButton(label: 'Features', onPressed: () => context.read<IndexCubit>().activateMenu(option: IndexMenuOption.features),),

              activeMenu == IndexMenuOption.faq ?  GlobalActiveMenuButton(label: 'FAQ',  onPressed: () {},) : GlobalInActiveMenuButton(label: 'FAQ',  onPressed: () {context.read<IndexCubit>().activateMenu(option: IndexMenuOption.faq);},),

              activeMenu == IndexMenuOption.reviews ? GlobalActiveMenuButton(label: 'Reviews', onPressed: () => context.go(notFoundSubPageRoute),) : GlobalInActiveMenuButton(label: 'Reviews', onPressed: () => context.read<IndexCubit>().activateMenu(option: IndexMenuOption.reviews),),

              activeMenu == IndexMenuOption.gallery ? GlobalActiveMenuButton(label: 'Gallery', onPressed: () {},): GlobalInActiveMenuButton(label: 'Gallery', onPressed: () {context.read<IndexCubit>().activateMenu(option: IndexMenuOption.gallery);},),
            ]
        );
      },
    );

  }


}
