import 'package:get_it/get_it.dart';
import 'package:paperless_listings/features/auth/data/repositories/auth_repository.dart';
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
  //  sl.registerLazySingleton(() => AuthRepository());
  sl.registerLazySingleton(() => AuthRepository());
  // sl.registerLazySingleton(() => PayoutRepository());
  // sl.registerLazySingleton(() => ReceiptRepository());
  // sl.registerLazySingleton(() => TaxRepository());
  // sl.registerLazySingleton(() => InvoiceRepository());
  // sl.registerLazySingleton(() => ChatRepository());
  // sl.registerLazySingleton(() => RentalRepository());
  // sl.registerLazySingleton(() => NotificationsRepository());



  // sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());

  //! Data sources
  //eg: sl.registerLazySingleton<ICacheDataSource>(() => CacheDataSourceImpl(sl()));

  //! Core
  //eg: sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  //eg: sl.registerLazySingleton(() => http.Client());
   sl.registerLazySingleton(() => NetworkProvider());

}