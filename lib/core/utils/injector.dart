import 'package:get_it/get_it.dart';
import 'package:paperless_listings/features/auth/data/repositories/auth_repository.dart';
import 'package:paperless_listings/features/gallery/data/repositories/gallery_repository.dart';
import 'package:paperless_listings/features/kyc/presentation/data/repositories/kyc_repository.dart';
import '../network/network_provider.dart';

/// Using Get It as the service locator -> for dependency injections
final sl = GetIt.instance;

/// Initializes all dependencies.
/// We register as lazy singletons to boost performance
/// meaning, Get It would instantiate objects on demand
Future<void> init() async {

  //! State managements
  // eg: sl.registerFactory(() => ExampleBloc());
  // sl.registerLazySingleton(() => BaseLayoutRepository());
  // sl.registerLazySingleton(() => ExampleRepository());


  //! Repositories
  sl.registerLazySingleton(() => AuthRepository());
  sl.registerLazySingleton(() => GalleryRepository());
  sl.registerLazySingleton(() => KYCRepository());


   sl.registerLazySingleton(() => NetworkProvider());

}