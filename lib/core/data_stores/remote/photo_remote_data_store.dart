import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_cvs/core/data_stores/api_client.dart';

import '../../entities/photo.dart';

part 'photo_remote_data_store.g.dart';

@RestApi()
abstract class PhotoRemoteDateStore {
  factory PhotoRemoteDateStore() {
    final dio = GetIt.I.get<ApiClient>().client;
    return _PhotoRemoteDateStore(dio);
  }

  @GET("/photos")
  Future<List<Photo>> getPhotos();
}
