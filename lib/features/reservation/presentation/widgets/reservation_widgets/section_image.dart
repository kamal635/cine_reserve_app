import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_reserve_app/core/constant/strings.dart';
import 'package:cine_reserve_app/features/home/domain/entity/movie_entity.dart';
import 'package:flutter/material.dart';

class SectionImageReversation extends StatelessWidget {
  const SectionImageReversation({super.key, required this.moviesEntity});
  final MoviesEntity moviesEntity;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.7,
      width: MediaQuery.of(context).size.width,
      child: Hero(
        tag: moviesEntity.idMovie!,
        child: CachedNetworkImage(
          imageUrl: "$kBaseImage${moviesEntity.posterPathMovie}",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
