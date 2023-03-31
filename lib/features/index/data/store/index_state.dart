import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:paperless_listings/core/utils/enums.dart';

part 'index_state.g.dart';

@CopyWith()
class IndexState extends Equatable {

  final BlocStatus status;
  final String message;
    final IndexMenuOption menuOption;

  const IndexState({
    this.status = BlocStatus.initial,
    this.message = '',
    this.menuOption = IndexMenuOption.gallery
  });

  @override
  List<Object?> get props => [status];

}