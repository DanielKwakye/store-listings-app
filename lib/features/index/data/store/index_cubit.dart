import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paperless_listings/core/utils/enums.dart';
import 'package:paperless_listings/features/index/data/store/index_state.dart';

class IndexCubit extends Cubit<IndexState> {

  IndexCubit(): super(const IndexState());

  /// Call this method to activate index menu options
  void activateMenu({required IndexMenuOption option}) {
    if(state.menuOption == option) { return; }
    emit(state.copyWith(status: BlocStatus.activateIndexMenuOptionInProgress));
    emit(state.copyWith(
        status: BlocStatus.activateIndexMenuOptionCompleted,
        menuOption: option
    ));
  }

}