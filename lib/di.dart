import 'package:get_it/get_it.dart';
import 'package:test_cvs/core/data_stores/api_client.dart';
import 'package:test_cvs/core/data_stores/local/photo_repository.dart';
import 'package:test_cvs/core/data_stores/remote/photo_remote_data_store.dart';

class DI {
  Future<void> setup() async {
    GetIt.I.registerSingleton(ApiClient());
    GetIt.I.registerLazySingleton(() => PhotoRepository());
    GetIt.I.registerLazySingleton(() => PhotoRemoteDateStore());
  }
}
