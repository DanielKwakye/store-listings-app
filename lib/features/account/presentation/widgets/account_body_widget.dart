import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:paperless_listings/core/utils/enums.dart';
import 'package:paperless_listings/core/utils/extensions.dart';
import 'package:paperless_listings/core/utils/theme.dart';
import 'package:paperless_listings/features/account/data/store/account_cubit.dart';
import 'package:paperless_listings/features/account/data/store/account_state.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_border_widget.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_error_widget.dart';
import 'package:paperless_listings/features/plugins/presentation/pages/plugins_sub_page.dart';

class AccountBodyWidget extends StatelessWidget {
  const AccountBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        if(state.menuOption == AccountMenuOption.plugins) {
          return const PluginsSubPage();
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
