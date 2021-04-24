// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'linked_card_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinkedCardDto _$LinkedCardDtoFromJson(Map<String, dynamic> json) {
  return LinkedCardDto(
    id: json['id'] as String,
    linkedDate: json['linkedDate'] == null
        ? null
        : DateTime.parse(json['linkedDate'] as String),
    cardType: _$enumDecodeNullable(_$CardTypeEnumMap, json['cardType']),
    cardNumber: json['cardNumber'] as String,
    cardExpiryDate: json['cardExpiryDate'] as String,
    cardHolderName: json['cardHolderName'] as String,
    cardCVV: json['cardCVV'] as String,
  );
}

Map<String, dynamic> _$LinkedCardDtoToJson(LinkedCardDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'linkedDate': instance.linkedDate?.toIso8601String(),
      'cardType': _$CardTypeEnumMap[instance.cardType],
      'cardNumber': instance.cardNumber,
      'cardExpiryDate': instance.cardExpiryDate,
      'cardHolderName': instance.cardHolderName,
      'cardCVV': instance.cardCVV,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$CardTypeEnumMap = {
  CardType.otherBrand: 'otherBrand',
  CardType.mastercard: 'mastercard',
  CardType.visa: 'visa',
  CardType.americanExpress: 'americanExpress',
  CardType.discover: 'discover',
};
