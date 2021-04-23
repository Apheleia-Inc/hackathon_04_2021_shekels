import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:json_annotation/json_annotation.dart';

enum AppThemeMode {
  light,
  dark,
}

enum PlanKey {
  @JsonValue('free')
  free,
  @JsonValue('basic')
  basic,
  @JsonValue('premium')
  premium,
  @JsonValue('elite')
  elite,
  // Archived
  @JsonValue('gold')
  gold,
}

enum RecurInterval {
  @JsonValue('month')
  month,
  @JsonValue('year')
  year,
}

enum AlertType {
  single,
  chained,
}

enum AlertConditionType {
  @JsonValue('volume')
  volume,
  @JsonValue('fiftyTwoHigh')
  fiftyTwoHigh,
  @JsonValue('fiftyTwoLow')
  fiftyTwoLow,
  @JsonValue('price')
  price,
  @JsonValue('percentChange')
  percentChange,
  @JsonValue('indicator')
  indicator,
}

enum AlertConditionSubType {
  priceAbove,
  priceBelow,
  volumeAbove,
  volumeBelow,
  fiftyTwoWeekHigh,
  fiftyTwoWeekLow,
  percentChange,
}

enum ConditionLimitType {
  @JsonValue('above')
  above,
  @JsonValue('below')
  below,
}

enum RelayType {
  @JsonValue('sms')
  sms,
  @JsonValue('pushNotification')
  pushNotification,
  @JsonValue('email')
  email,
}

extension RelayTypeExtension on RelayType {
  IconData getIconData() {
    switch (this) {
      case RelayType.sms:
        return FontAwesome.phone;
      case RelayType.pushNotification:
        return FontAwesome.bell;
      case RelayType.email:
        return FontAwesome.envelope;
      default:
        return FontAwesome.bell;
    }
  }
}

enum ConditionInputKey {
  targetPrice,
  targetPercentChange,
  targetVolume,
}

enum MessageType {
  @JsonValue('general')
  general,
  @JsonValue('media')
  media,
}

enum StockTimeRange {
  @JsonValue("max")
  max,
  @JsonValue("5y")
  y5,
  @JsonValue("2y")
  y2,
  @JsonValue("1y")
  y1,
  @JsonValue("ytd")
  ytd,
  @JsonValue("6m")
  m6,
  @JsonValue("3m")
  m3,
  @JsonValue("1m")
  m1,
  @JsonValue("1mm")
  mm1,
  @JsonValue("1d")
  d1,
  @JsonValue("5d")
  d5,
  @JsonValue("5dm")
  dm5,
  @JsonValue("dynamic")
  timeDynamic,
  @JsonValue("date")
  date
}

enum NewsMediaType {
  @JsonValue('video')
  video,
  @JsonValue('article')
  article,
}

enum NewsSentiment {
  @JsonValue('positive')
  positive,
  @JsonValue('neutral')
  neutral,
  @JsonValue('negative')
  negative,
}

enum Sentiment {
  @JsonValue('pos')
  positive,
  @JsonValue('neu')
  neutral,
  @JsonValue('neg')
  negative,
}

enum TransactionType {
  @JsonValue('stock')
  stock,
  @JsonValue('option')
  option,
}

extension TransactionTypeExtension on TransactionType {
  String getDisplayText() {
    switch (this) {
      case TransactionType.stock:
        return 'Stock';
      case TransactionType.option:
        return 'Option';
    }

    return 'N/A';
  }
}

enum TransactionTradeType {
  @JsonValue('buy')
  buy,
  @JsonValue('sell')
  sell,
}

extension TransactionTradeTypeExtension on TransactionTradeType {
  String getDisplayText() {
    switch (this) {
      case TransactionTradeType.buy:
        return 'Buy';
      case TransactionTradeType.sell:
        return 'Sell';
    }

    return 'N/A';
  }
}

enum TransactionOptionType {
  @JsonValue('call')
  call,
  @JsonValue('put')
  put,
}

extension TransactionOptionTypeExtension on TransactionOptionType {
  String getDisplayText() {
    switch (this) {
      case TransactionOptionType.call:
        return 'Call';
      case TransactionOptionType.put:
        return 'Put';
    }

    return 'N/A';
  }
}
