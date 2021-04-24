import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:json_annotation/json_annotation.dart';

part 'linked_card_dto.g.dart';

@JsonSerializable()
class LinkedCardDto {
  final String id;
  final DateTime linkedDate;
  final CardType cardType;
  final String cardNumber;
  final String cardExpiryDate;
  final String cardHolderName;
  final String cardCVV;

  LinkedCardDto({
    @required this.id,
    @required this.linkedDate,
    @required this.cardType,
    @required this.cardNumber,
    @required this.cardExpiryDate,
    @required this.cardHolderName,
    @required this.cardCVV,
  });

  factory LinkedCardDto.fromJson(Map<String, dynamic> json) =>
      _$LinkedCardDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LinkedCardDtoToJson(this);
}
