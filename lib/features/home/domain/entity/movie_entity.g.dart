// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoviesEntityAdapter extends TypeAdapter<MoviesEntity> {
  @override
  final int typeId = 0;

  @override
  MoviesEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MoviesEntity(
      idMovie: fields[0] as int?,
      adultMovie: fields[1] as bool?,
      backdropPathMovie: fields[2] as String?,
      genreIdsMovie: (fields[3] as List?)?.cast<dynamic>(),
      originalLanguageMovie: fields[4] as String?,
      originalTitleMovie: fields[5] as String?,
      overviewMovie: fields[6] as String?,
      popularityMovie: fields[7] as double?,
      posterPathMovie: fields[8] as String?,
      releaseDateMovie: fields[9] as String?,
      titleMovie: fields[10] as String?,
      videoMovie: fields[11] as bool?,
      voteAverageMovie: fields[12] as double?,
      voteCountMovie: fields[13] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, MoviesEntity obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.idMovie)
      ..writeByte(1)
      ..write(obj.adultMovie)
      ..writeByte(2)
      ..write(obj.backdropPathMovie)
      ..writeByte(3)
      ..write(obj.genreIdsMovie)
      ..writeByte(4)
      ..write(obj.originalLanguageMovie)
      ..writeByte(5)
      ..write(obj.originalTitleMovie)
      ..writeByte(6)
      ..write(obj.overviewMovie)
      ..writeByte(7)
      ..write(obj.popularityMovie)
      ..writeByte(8)
      ..write(obj.posterPathMovie)
      ..writeByte(9)
      ..write(obj.releaseDateMovie)
      ..writeByte(10)
      ..write(obj.titleMovie)
      ..writeByte(11)
      ..write(obj.videoMovie)
      ..writeByte(12)
      ..write(obj.voteAverageMovie)
      ..writeByte(13)
      ..write(obj.voteCountMovie);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoviesEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
