// import 'package:flutter/material.dart';
// import 'package:json_annotation/json_annotation.dart';
// import 'package:hackathon_04_2021_shekels/core/app_models/watch_list_app_model.dart';
// import 'package:hackathon_04_2021_shekels/core/dtos/stock/company_summary_dto.dart';
// import 'package:hackathon_04_2021_shekels/core/dtos/stock/intraday_price_dto.dart';
// import 'package:hackathon_04_2021_shekels/core/dtos/stock/stock_quote_dto.dart';

// part 'watch_list_dto.g.dart';

// @JsonSerializable()
// class GetWatchListResponseDto {
//   final List<WatchListDto> watchListList;
//   final List<TickerDetailDto> tickerDetailList;

//   GetWatchListResponseDto({
//     @required this.watchListList,
//     @required this.tickerDetailList,
//   });

//   factory GetWatchListResponseDto.fromJson(Map<String, dynamic> json) =>
//       _$GetWatchListResponseDtoFromJson(json);
//   Map<String, dynamic> toJson() => _$GetWatchListResponseDtoToJson(this);

//   List<WatchListAppModel> toWatchListAppModels() {
//     return this.watchListList.map((watchList) {
//       List<TickerDetailDto> tickerDetalList = watchList.tickerInfoList
//           .map(
//             (tickerInfo) => this.tickerDetailList.firstWhere(
//                 (tickerDetail) => tickerDetail.ticker == tickerInfo.ticker),
//           )
//           .toList();

//       return WatchListAppModel(
//         watchListId: watchList.watchListId,
//         watchListUIInfo: watchList.watchListUIInfo,
//         tickerDetailList: tickerDetalList,
//       );
//     }).toList();
//   }
// }

// @JsonSerializable()
// class WriteWatchListDto {
//   final WatchListUIInfoDto watchListUIInfo;
//   final List<TickerInfoDto> tickerInfoList;

//   WriteWatchListDto({
//     @required this.watchListUIInfo,
//     @required this.tickerInfoList,
//   });

//   factory WriteWatchListDto.fromJson(Map<String, dynamic> json) =>
//       _$WriteWatchListDtoFromJson(json);
//   Map<String, dynamic> toJson() => _$WriteWatchListDtoToJson(this);
// }

// @JsonSerializable()
// class DeleteWatchListDto {
//   final List<String> idList;

//   DeleteWatchListDto({
//     @required this.idList,
//   });

//   factory DeleteWatchListDto.fromJson(Map<String, dynamic> json) =>
//       _$DeleteWatchListDtoFromJson(json);
//   Map<String, dynamic> toJson() => _$DeleteWatchListDtoToJson(this);
// }

// @JsonSerializable()
// class WatchListDto {
//   final String watchListId;
//   final WatchListUIInfoDto watchListUIInfo;
//   final List<TickerInfoDto> tickerInfoList;

//   WatchListDto({
//     @required this.watchListId,
//     @required this.watchListUIInfo,
//     @required this.tickerInfoList,
//   });

//   factory WatchListDto.fromJson(Map<String, dynamic> json) =>
//       _$WatchListDtoFromJson(json);
//   Map<String, dynamic> toJson() => _$WatchListDtoToJson(this);
// }

// @JsonSerializable()
// class WatchListUIInfoDto {
//   final String icon;
//   final String name;

//   WatchListUIInfoDto({
//     @required this.icon,
//     @required this.name,
//   });

//   factory WatchListUIInfoDto.fromJson(Map<String, dynamic> json) =>
//       _$WatchListUIInfoDtoFromJson(json);
//   Map<String, dynamic> toJson() => _$WatchListUIInfoDtoToJson(this);
// }

// @JsonSerializable()
// class TickerInfoDto {
//   final String ticker;
//   final String companyName;

//   TickerInfoDto({
//     @required this.ticker,
//     @required this.companyName,
//   });

//   factory TickerInfoDto.fromJson(Map<String, dynamic> json) =>
//       _$TickerInfoDtoFromJson(json);
//   Map<String, dynamic> toJson() => _$TickerInfoDtoToJson(this);

//   factory TickerInfoDto.fromCompanySummary(CompanySummaryDto dto) {
//     return TickerInfoDto(
//       ticker: dto.symbol,
//       companyName: dto.companyName,
//     );
//   }
// }

// @JsonSerializable()
// class TickerDetailDto {
//   final String ticker;
//   final List<IntradayPriceDto> sparklineData;
//   final QuoteDto quote;

//   TickerDetailDto({
//     @required this.ticker,
//     @required this.sparklineData,
//     @required this.quote,
//   });

//   factory TickerDetailDto.fromJson(Map<String, dynamic> json) =>
//       _$TickerDetailDtoFromJson(json);
//   Map<String, dynamic> toJson() => _$TickerDetailDtoToJson(this);
// }
