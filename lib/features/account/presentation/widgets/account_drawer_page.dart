import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:paperless_listings/app/routing/route_constants.dart';
import 'package:paperless_listings/core/utils/constants.dart';
import 'package:paperless_listings/core/utils/enums.dart';
import 'package:paperless_listings/core/utils/functions.dart';
import 'package:paperless_listings/core/utils/theme.dart';
import 'package:paperless_listings/features/account/data/store/account_cubit.dart';
import 'package:paperless_listings/features/account/data/store/account_state.dart';

class AccountDrawerPage extends StatelessWidget {

  final Function(AccountMenuOption option)? onItemTap;
  const AccountDrawerPage({this.onItemTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final theme = themeOf(context);
    final routeLocation = GoRouter.of(context).location;

    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
             children: [
                const SizedBox(height: 50,),
                LayoutBuilder(builder: (ctx, ctr) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(500),
                    child: SizedBox(
                      width: ctr.maxWidth  * 0.3,
                      height: ctr.maxWidth * 0.3,
                      child:  Image.asset(kAvatarUser1, fit: BoxFit.cover,),
                    ),
                  );
                }),
                const SizedBox(height: 10,),
                Text('Aundrey Nana', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),),
                Text('aundry.nana@gmail.com', style: theme.textTheme.bodySmall?.copyWith(),),
               const SizedBox(height: 30,),
               ListTile(
                  leading: Icon(FeatherIcons.layout, color: routeLocation != kycPageRoute && state.menuOption == AccountMenuOption.dashboard ? kAppRed : kAppBlack,),
                  title: Text('Dashboard', style: TextStyle(fontSize: 14, color: routeLocation != kycPageRoute && state.menuOption == AccountMenuOption.dashboard ? kAppRed : kAppBlack),),
                  horizontalTitleGap: 0,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                 onTap: () {
                   if(routeLocation == kycPageRoute){
                     context.go(accountPageRoute);
                   }
                   context.read<AccountCubit>().activateMenu(option: AccountMenuOption.dashboard);
                   onItemTap?.call(AccountMenuOption.dashboard);
                 },
                ),
               ListTile(
                 leading: Icon(FeatherIcons.user,  color: routeLocation != kycPageRoute && state.menuOption == AccountMenuOption.profile ? kAppRed : kAppBlack,),
                 title:  Text('Profile', style: TextStyle(fontSize: 14, color: routeLocation != kycPageRoute && state.menuOption == AccountMenuOption.profile ? kAppRed : kAppBlack),),
                 horizontalTitleGap: 0,
                 contentPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                 onTap: () {
                   if(routeLocation == kycPageRoute){
                     context.go(accountPageRoute);
                   }
                   context.read<AccountCubit>().activateMenu(option: AccountMenuOption.profile);
                   onItemTap?.call(AccountMenuOption.profile);
                 },
               ),
               ListTile(
                 leading: Icon(FeatherIcons.list, color: routeLocation != kycPageRoute && state.menuOption == AccountMenuOption.myListings ? kAppRed : kAppBlack),
                 title:  Text('My listings', style: TextStyle(fontSize: 14, color: routeLocation != kycPageRoute && state.menuOption == AccountMenuOption.myListings ? kAppRed : kAppBlack),),
                 horizontalTitleGap: 0,
                 contentPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                 onTap: () {
                   if(routeLocation == kycPageRoute){
                     context.go(accountPageRoute);
                   }
                   context.read<AccountCubit>().activateMenu(option: AccountMenuOption.myListings);
                   onItemTap?.call(AccountMenuOption.myListings);
                 },
               ),
               ListTile(
                 leading: Icon(FeatherIcons.heart, color: routeLocation != kycPageRoute && state.menuOption == AccountMenuOption.favorite ? kAppRed : kAppBlack),
                 title:  Text('Favorites', style: TextStyle(fontSize: 14, color: routeLocation != kycPageRoute && state.menuOption == AccountMenuOption.favorite ? kAppRed : kAppBlack),),
                 horizontalTitleGap: 0,
                 contentPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                 onTap: () {
                   if(routeLocation == kycPageRoute){
                     context.go(accountPageRoute);
                   }
                   context.read<AccountCubit>().activateMenu(option: AccountMenuOption.favorite);
                   onItemTap?.call(AccountMenuOption.favorite);
                 },
               ),
               ListTile(
                 leading: Icon(FeatherIcons.file, color: routeLocation == kycPageRoute ? kAppRed : kAppBlack),
                 title:  Text('KYC', style: TextStyle(fontSize: 14, color: routeLocation == kycPageRoute ? kAppRed : kAppBlack),),
                 horizontalTitleGap: 0,
                 contentPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                 onTap: () {
                   context.go(kycPageRoute);
                   onItemTap?.call(AccountMenuOption.favorite);
                 },
               ),
               ListTile(
                 leading: Icon(FeatherIcons.pieChart, color: routeLocation != kycPageRoute && state.menuOption == AccountMenuOption.plugins ? kAppRed : kAppBlack),
                 title:  Text('Plugins', style: TextStyle(fontSize: 14, color: routeLocation != kycPageRoute && state.menuOption == AccountMenuOption.plugins ? kAppRed : kAppBlack),),
                 horizontalTitleGap: 0,
                 contentPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                 onTap: () {
                   if(routeLocation == kycPageRoute){
                     context.go(accountPageRoute);
                   }
                   context.read<AccountCubit>().activateMenu(option: AccountMenuOption.plugins);
                   onItemTap?.call(AccountMenuOption.plugins);
                 },
               )
             ],
          ),
        );
      },
    );
  }
}
