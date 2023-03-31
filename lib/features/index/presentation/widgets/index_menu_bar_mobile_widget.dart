import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paperless_listings/core/utils/enums.dart';
import 'package:paperless_listings/core/utils/extensions.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_border_widget.dart';
import 'package:paperless_listings/features/index/data/store/index_cubit.dart';
import 'package:paperless_listings/features/index/data/store/index_state.dart';

import '../../../../core/utils/theme.dart';

class IndexMenuBarMobileWidget extends StatefulWidget {

  const IndexMenuBarMobileWidget({Key? key}) : super(key: key);

  @override
  State<IndexMenuBarMobileWidget> createState() => _IndexMenuBarMobileWidgetState();
}

class _IndexMenuBarMobileWidgetState extends State<IndexMenuBarMobileWidget> {
  final controller = DraggableScrollableController();
  final minChildSize = 0.1;
  final maxChildSize = 0.5;
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (DraggableScrollableNotification notification){
        if(notification.extent == minChildSize){
          setState(() {
            expanded = false;
          });
        }
        else if(notification.extent == maxChildSize){
          setState(() {
            expanded = true;
          });
        }
        return true;
      },
      child: DraggableScrollableSheet(
          initialChildSize: minChildSize,
          minChildSize: minChildSize,
          maxChildSize: maxChildSize,
          expand: true,
          controller: controller,
          builder: (ctx , controller) {
            return  Container(
              decoration: const BoxDecoration(
                color: kAppRed,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4))
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                controller: controller,
                physics: const ClampingScrollPhysics(),
                children: [

                  if(!expanded) ... {
                    BlocBuilder<IndexCubit, IndexState>(
                      builder: (context, indexState) {
                        return ListTile(
                          title: Text(indexState.menuOption.name.capitalize(), style: const TextStyle(color: kAppWhite),),
                          tileColor: kAppRed,
                          onTap: () {
                            animatedExpand();
                          },
                          trailing: const Icon(Icons.keyboard_arrow_up , color:  kAppWhite,),
                        );
                      },
                    )
                  },

                  if(expanded)
                    ListTile(
                      title: const Text('Menu', style: TextStyle(color: kAppWhite),),
                      onTap: () {
                        context.read<IndexCubit>().activateMenu(option: IndexMenuOption.about);
                        animatedHide();
                      },
                      trailing: const Icon(Icons.keyboard_arrow_down , color:  kAppWhite,),
                    ),
                  if(expanded)
                    const GlobalBorderWidget(paddingTop: 10, paddingBottom: 10, color: kAppWhite,),

                  ListTile(
                    title: const Text('About', style: TextStyle(color: kAppWhite),),
                    onTap: () {
                      context.read<IndexCubit>().activateMenu(option: IndexMenuOption.about);
                      animatedHide();
                    },
                  ),
                  ListTile(
                    title: const Text('Our menu', style: TextStyle(color: kAppWhite),),
                    onTap: () {
                      context.read<IndexCubit>().activateMenu(option: IndexMenuOption.menu);
                      animatedHide();
                    },
                  ),
                  ListTile(
                    title: const Text('Features', style: TextStyle(color: kAppWhite),),
                    onTap: () {
                      context.read<IndexCubit>().activateMenu(option: IndexMenuOption.features);
                      animatedHide();
                    },
                  ),
                  ListTile(
                    title: const Text('FAQ', style: TextStyle(color: kAppWhite),),
                    onTap: () {
                      context.read<IndexCubit>().activateMenu(option: IndexMenuOption.faq);
                      animatedHide();
                    },
                  ),
                  ListTile(
                    title: const Text('Reviews', style: TextStyle(color: kAppWhite),),
                    onTap: () {
                      context.read<IndexCubit>().activateMenu(option: IndexMenuOption.reviews);
                      animatedHide();
                    },
                  ),
                  ListTile(
                    title: const Text('Gallery', style: TextStyle(color: kAppWhite),),
                    onTap: () {
                      context.read<IndexCubit>().activateMenu(option: IndexMenuOption.gallery);
                      animatedHide();
                    },
                  ),
                ],),
            );
          }
      ),
    );
  }

  void animatedHide() {
    controller.animateTo(
      minChildSize,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOutBack,
    );
  }

  void animatedExpand() {
    controller.animateTo(
      maxChildSize,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOutBack,
    );
  }
}
