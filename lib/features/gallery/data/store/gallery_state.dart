import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:paperless_listings/core/utils/enums.dart';
import 'package:paperless_listings/features/gallery/data/models/animal_model.dart';

part 'gallery_state.g.dart';

@CopyWith()
class GalleryState extends Equatable {

  final BlocStatus status;
  final String message;
  final List<AnimalModel> animals;

  const GalleryState({
    this.status = BlocStatus.initial,
    this.message = '',
    this.animals = const [],
  });

  @override
  List<Object?> get props => [status];
}

