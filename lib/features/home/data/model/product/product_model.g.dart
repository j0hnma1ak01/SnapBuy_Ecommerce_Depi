// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 0;

  @override
  ProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
      id: fields[0] as int,
      title: fields[1] as String,
      description: fields[2] as String,
      category: fields[3] as String,
      price: fields[4] as double,
      discountPercentage: fields[5] as double,
      rating: fields[6] as double,
      stock: fields[7] as int,
      brand: fields[8] as String,
      sku: fields[9] as String,
      availabilityStatus: fields[10] as String,
      reviews: (fields[11] as List).cast<ReviewModel>(),
      returnPolicy: fields[12] as String,
      meta: fields[13] as Meta,
      images: (fields[14] as List).cast<String>(),
      thumbnail: fields[15] as String,
      quantity: fields[16] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.discountPercentage)
      ..writeByte(6)
      ..write(obj.rating)
      ..writeByte(7)
      ..write(obj.stock)
      ..writeByte(8)
      ..write(obj.brand)
      ..writeByte(9)
      ..write(obj.sku)
      ..writeByte(10)
      ..write(obj.availabilityStatus)
      ..writeByte(11)
      ..write(obj.reviews)
      ..writeByte(12)
      ..write(obj.returnPolicy)
      ..writeByte(13)
      ..write(obj.meta)
      ..writeByte(14)
      ..write(obj.images)
      ..writeByte(15)
      ..write(obj.thumbnail)
      ..writeByte(16)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ReviewModelAdapter extends TypeAdapter<ReviewModel> {
  @override
  final int typeId = 1;

  @override
  ReviewModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReviewModel(
      rating: fields[0] as double,
      comment: fields[1] as String,
      date: fields[2] as String,
      reviewerName: fields[3] as String,
      reviewerEmail: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ReviewModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.rating)
      ..writeByte(1)
      ..write(obj.comment)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.reviewerName)
      ..writeByte(4)
      ..write(obj.reviewerEmail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReviewModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MetaAdapter extends TypeAdapter<Meta> {
  @override
  final int typeId = 2;

  @override
  Meta read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Meta(
      barcode: fields[0] as String,
      qrCode: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Meta obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.barcode)
      ..writeByte(1)
      ..write(obj.qrCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MetaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
