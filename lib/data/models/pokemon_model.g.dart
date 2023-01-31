// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonModelAdapter extends TypeAdapter<PokemonModel> {
  @override
  final int typeId = 1;

  @override
  PokemonModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PokemonModel(
      id: fields[0] as int,
      name: fields[1] as String,
      imageUrl: fields[2] as String,
      weight: fields[3] as int,
      height: fields[4] as int,
      baseExperience: fields[5] as int,
      isFavorite: fields[6] as bool,
      color: fields[7] as String,
      eggGroups: (fields[8] as List).cast<String>(),
      types: (fields[9] as List).cast<String>(),
      stats: (fields[10] as List)
          .map((dynamic e) => (e as Map).cast<String, int>())
          .toList(),
      abilities: (fields[11] as List).cast<String>(),
      moves: (fields[12] as List).cast<String>(),
      habitats: (fields[13] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, PokemonModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.weight)
      ..writeByte(4)
      ..write(obj.height)
      ..writeByte(5)
      ..write(obj.baseExperience)
      ..writeByte(6)
      ..write(obj.isFavorite)
      ..writeByte(7)
      ..write(obj.color)
      ..writeByte(8)
      ..write(obj.eggGroups)
      ..writeByte(9)
      ..write(obj.types)
      ..writeByte(10)
      ..write(obj.stats)
      ..writeByte(11)
      ..write(obj.abilities)
      ..writeByte(12)
      ..write(obj.moves)
      ..writeByte(13)
      ..write(obj.habitats);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
