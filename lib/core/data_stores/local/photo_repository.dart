import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:get_it/get_it.dart';

import '../../entities/photo.dart';
import '../remote/photo_remote_data_store.dart';

class PhotoRepository {
  final _photoRemoteDataStore = GetIt.I.get<PhotoRemoteDateStore>();

  Future<Either<String, List<Photo>>> fetchPhotos() async {
    try {
      final photos = await _photoRemoteDataStore.getPhotos();
      return Right(photos);
    } catch (e) {
      return Left("Error retrieving data from Server.");
    }
  }
}
