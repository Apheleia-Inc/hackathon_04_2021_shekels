import 'package:flutter/material.dart';
import 'package:hackathon_04_2021_shekels/core/dtos/linked_card_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'promotion_dto.g.dart';

@JsonSerializable()
class PromotionDto {
  final String id;
  final String name;
  final String description;
  final DateTime expirationDate;
  final bool isApplied;
  final String category;
  final StoreDto store;
  final LinkedCardDto fromCard;

  PromotionDto({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.expirationDate,
    @required this.isApplied,
    @required this.category,
    @required this.store,
    @required this.fromCard,
  });

  factory PromotionDto.fromJson(Map<String, dynamic> json) =>
      _$PromotionDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PromotionDtoToJson(this);
}

@JsonSerializable()
class StoreDto {
  final String url;
  final String name;
  final String imageUrl;

  StoreDto({
    @required this.url,
    @required this.name,
    @required this.imageUrl,
  });

  factory StoreDto.fromJson(Map<String, dynamic> json) =>
      _$StoreDtoFromJson(json);
  Map<String, dynamic> toJson() => _$StoreDtoToJson(this);
}
