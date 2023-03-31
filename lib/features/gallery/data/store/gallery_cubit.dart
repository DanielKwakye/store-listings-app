import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paperless_listings/core/utils/enums.dart';
import 'package:paperless_listings/core/utils/injector.dart';
import 'package:paperless_listings/features/gallery/data/repositories/gallery_repository.dart';
import 'package:paperless_listings/features/gallery/data/store/gallery_state.dart';


class GalleryCubit extends Cubit<GalleryState> {

  final galleryRepository = sl<GalleryRepository>();

  GalleryCubit() : super(const GalleryState());

  /// Call this method to get the list of animals
  void fetchAnimals() async {

    try {

      emit(state.copyWith(
          status: BlocStatus.fetchAnimalsInProgress
      ));

      // fetch data from API
      final either = await galleryRepository.fetchAnimals();

      either.fold((error) {

        // When there's in fetching from the api
        emit(state.copyWith(
          status: BlocStatus.fetchAnimalsFailed,
          message: error.errorDescription
        ));

      }, (data) {

        // When data is returned from the api
        emit(state.copyWith(
            status: BlocStatus.fetchAnimalsSuccessful,
            animals: data
        ));

      });

    }catch(error) {

      emit(state.copyWith(
          status: BlocStatus.fetchAnimalsFailed,
          message: error.toString()
      ));
    }
  }

}
