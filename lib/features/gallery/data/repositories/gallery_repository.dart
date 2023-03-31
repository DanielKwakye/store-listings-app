import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:paperless_listings/core/network/api_error.dart';
import 'package:paperless_listings/core/network/network_provider.dart';
import 'package:paperless_listings/features/gallery/data/models/animal_model.dart';
import '../../../../core/network/api_config.dart';

class GalleryRepository {

  final NetworkProvider _networkProvider = NetworkProvider();

  Future<Either<ApiError, List<AnimalModel>>> fetchAnimals()async {
    try {
      var response = await _networkProvider.call(
          path: ApiConfig.fetchCats,
          method: RequestMethod.get);

      if (response!.statusCode == 200) {
        final networkResponseList = List<AnimalModel>.from(response.data.map((x) => AnimalModel.fromJson(x)));
        return Right(networkResponseList);
      }

      return Left(ApiError(errorDescription: response.data['error']));

    } on DioError catch (e) {
      return Left(ApiError(errorDescription: e.message ?? ''));
    }

  }

}