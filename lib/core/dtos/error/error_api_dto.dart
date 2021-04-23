import 'package:json_annotation/json_annotation.dart';

part 'error_api_dto.g.dart';

@JsonSerializable()
class ErrorApiDto {
  int status;
  String message;
  String detailMessage;

  ErrorApiDto({
    this.status,
    this.message,
    this.detailMessage,
  });

  factory ErrorApiDto.fromJson(Map<String, dynamic> json) =>
      _$ErrorApiDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorApiDtoToJson(this);
}
