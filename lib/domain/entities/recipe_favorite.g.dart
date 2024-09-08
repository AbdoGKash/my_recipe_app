// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_favorite.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeModelAdapter extends TypeAdapter<RecipeModel> {
  @override
  final int typeId = 0;

  @override
  RecipeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipeModel(
      id: fields[0] as String?,
      fats: fields[1] as String?,
      name: fields[2] as String?,
      time: fields[3] as String?,
      image: fields[4] as String?,
      weeks: (fields[5] as List?)?.cast<String>(),
      carbos: fields[6] as String?,
      country: fields[7] as String?,
      calories: fields[8] as String?,
      headline: fields[9] as String?,
      products: (fields[10] as List?)?.cast<String>(),
      proteins: fields[11] as String?,
      difficulty: fields[13] as int?,
      description: fields[14] as String?,
      ingredients: (fields[15] as List?)?.cast<String>(),
      deliverableIngredients: (fields[16] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, RecipeModel obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fats)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.time)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.weeks)
      ..writeByte(6)
      ..write(obj.carbos)
      ..writeByte(7)
      ..write(obj.country)
      ..writeByte(8)
      ..write(obj.calories)
      ..writeByte(9)
      ..write(obj.headline)
      ..writeByte(10)
      ..write(obj.products)
      ..writeByte(11)
      ..write(obj.proteins)
      ..writeByte(13)
      ..write(obj.difficulty)
      ..writeByte(14)
      ..write(obj.description)
      ..writeByte(15)
      ..write(obj.ingredients)
      ..writeByte(16)
      ..write(obj.deliverableIngredients);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
