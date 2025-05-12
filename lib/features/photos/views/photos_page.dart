import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_cvs/core/entities/photo.dart';

import '../cubits/photo_cubit.dart';

class PhotosPage extends StatelessWidget {
  const PhotosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Photos")),
      body: BlocProvider(
        create: (_) => PhotoCubit()..fetchPhotos(),
        child: BlocBuilder<PhotoCubit, PhotoState>(
          builder: (context, state) {
            return switch (state) {
              Loading() => const CircularProgressIndicator.adaptive(),
              Failed(:final errorMessage) => Center(child: Text(errorMessage)),
              Success(:final photos) => ListView.separated(
                itemCount: photos.length,
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 32.0),
                itemBuilder: (_, index) => PhotoItemTile(photo: photos[index]),
                separatorBuilder: (_, index) => SizedBox(height: 12.0),
              ),
            };
          },
        ),
      ),
    );
  }
}

class PhotoItemTile extends StatelessWidget {
  const PhotoItemTile({super.key, required this.photo});

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: photo.url,
          height: 60.0,
          width: 60.0,
          placeholder: (_, __) => Icon(Icons.wifi_tethering_error_rounded),
          errorWidget:
              (_, __, ___) => Container(
                decoration: BoxDecoration(color: Colors.red.shade50),
                child: Icon(
                  Icons.wifi_tethering_error_rounded,
                  color: Colors.red,
                ),
              ),
        ),
        SizedBox(width: 12.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Id: ${photo.id} | Album Id: ${photo.albumId}"),
            Text(photo.title),
          ],
        ),
      ],
    );
  }
}
