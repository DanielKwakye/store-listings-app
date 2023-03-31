import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paperless_listings/core/utils/enums.dart';
import 'package:paperless_listings/features/account/data/store/account_state.dart';

class AccountCubit extends Cubit<AccountState> {

  AccountCubit(): super(const AccountState());

  /// Call this method to activate index menu options
  void activateMenu({required AccountMenuOption option}) {
    if(state.menuOption == option) { return; }
    emit(state.copyWith(status: BlocStatus.activateIndexMenuOptionInProgress));
    emit(state.copyWith(
        status: BlocStatus.activateIndexMenuOptionCompleted,
        menuOption: option
    ));
  }

}