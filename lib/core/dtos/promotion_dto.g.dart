// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PromotionDto _$PromotionDtoFromJson(Map<String, dynamic> json) {
  return PromotionDto(
    id: json['id'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
    expirationDate: json['expirationDate'] == null
        ? null
        : DateTime.parse(json['expirationDate'] as String),
    isApplied: json['isApplied'] as bool,
    category: json['category'] as String,
    store: json['store'] == null
        ? null
        : StoreDto.fromJson(json['store'] as Map<String, dynamic>),
    fromCard: json['fromCard'] == null
        ? null
        : LinkedCardDto.fromJson(json['fromCard'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PromotionDtoToJson(PromotionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'expirationDate': instance.expirationDate?.toIso8601String(),
      'isApplied': instance.isApplied,
      'category': instance.category,
      'store': instance.store,
      'fromCard': instance.fromCard,
    };

StoreDto _$StoreDtoFromJson(Map<String, dynamic> json) {
  return StoreDto(
    url: json['url'] as String,
    name: json['name'] as String,
    imageUrl: json['imageUrl'] as String,
  );
}

Map<String, dynamic> _$StoreDtoToJson(StoreDto instance) => <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
    };
