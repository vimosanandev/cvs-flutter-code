import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';

import '../../../core/data_stores/local/photo_repository.dart';
import '../../../core/entities/photo.dart';

part 'photo_cubit.freezed.dart';

class PhotoCubit extends Cubit<PhotoState> {
  PhotoCubit() : super(const Loading());

  final _photosRepository = GetIt.I.get<PhotoRepository>();

  Future<void> fetchPhotos() async {
    emit(const Loading());

    final response = await _photosRepository.fetchPhotos();

    response.fold(
      (error) => emit(Failed(error)),
      (photos) => emit(Success(photos)),
    );
  }
}

@freezed
sealed class PhotoState with _$PhotoState {
  const factory PhotoState.loading() = Loading;

  const factory PhotoState.success(List<Photo> photos) = Success;

  const factory PhotoState.failed(String errorMessage) = Failed;
}
