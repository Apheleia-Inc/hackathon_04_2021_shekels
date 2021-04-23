// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_api_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorApiDto _$ErrorApiDtoFromJson(Map<String, dynamic> json) {
  return ErrorApiDto(
    status: json['status'] as int,
    message: json['message'] as String,
    detailMessage: json['detailMessage'] as String,
  );
}

Map<String, dynamic> _$ErrorApiDtoToJson(ErrorApiDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'detailMessage': instance.detailMessage,
    };
