import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:paperless_listings/core/utils/enums.dart';

part 'kyc_state.g.dart';

@CopyWith()
class KYCState extends Equatable{

  final BlocStatus status;
  final String message;

  const KYCState({
    this.status = BlocStatus.initial,
    this.message = '',
  });

  @override
  List<Object?> get props => [status];

}