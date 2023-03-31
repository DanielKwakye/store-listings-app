import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:paperless_listings/core/utils/enums.dart';

part 'account_state.g.dart';

@CopyWith()
class AccountState extends Equatable {

  final BlocStatus status;
  final String message;
  final AccountMenuOption menuOption;

  const AccountState({
    this.status = BlocStatus.initial,
    this.message = '',
    this.menuOption = AccountMenuOption.plugins
  });

  @override
  List<Object?> get props => [status];

}