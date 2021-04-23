import 'package:hackathon_04_2021_shekels/extensions/list_extension.dart';
import 'package:hackathon_04_2021_shekels/utils/enums.dart';

class EnumUtils {
  static ValueT getValue<EnumT, ValueT>(
    Map<EnumT, EnumMetadata<ValueT>> enumMap,
    EnumT myEnum,
  ) {
    if (myEnum == null) {
      return null;
    }

    return enumMap[myEnum]?.value;
  }

  static String getDescription<T>(Map<T, EnumMetadata> enumMap, T myEnum) {
    if (myEnum == null) {
      return null;
    }

    return enumMap[myEnum]?.description;
  }

  static T getEnum<T>(Map<T, EnumMetadata> enumMap, dynamic value) {
    return enumMap.keys.firstOrDefault((key) => enumMap[key].value == value);
  }
}

class EnumMetadata<T> {
  final T value;
  final String description;

  const EnumMetadata({
    this.value,
    this.description,
  });
}

class EnumMap {
  static const Map<AppThemeMode, EnumMetadata<String>> appTheme = {
    AppThemeMode.light: EnumMetadata(value: 'light'),
    AppThemeMode.dark: EnumMetadata(value: 'dark'),
  };
  static const Map<ConditionLimitType, EnumMetadata<String>>
      conditionLimitType = {
    ConditionLimitType.above: EnumMetadata(value: 'above'),
    ConditionLimitType.below: EnumMetadata(value: 'below'),
  };
  static const Map<AlertConditionType, EnumMetadata<String>>
      alertConditionType = {
    AlertConditionType.volume: EnumMetadata(value: 'volume'),
    AlertConditionType.fiftyTwoHigh: EnumMetadata(value: 'fiftyTwoHigh'),
    AlertConditionType.fiftyTwoLow: EnumMetadata(value: 'fiftyTwoLow'),
    AlertConditionType.price: EnumMetadata(value: 'price'),
    AlertConditionType.percentChange: EnumMetadata(value: 'percentChange'),
    AlertConditionType.indicator: EnumMetadata(value: 'indicator'),
  };
  static const Map<RelayType, EnumMetadata<String>> relayType = {
    RelayType.sms: EnumMetadata(description: 'Sms'),
    RelayType.pushNotification: EnumMetadata(description: 'Push Notification'),
    RelayType.email: EnumMetadata(description: 'Email'),
  };
  static const Map<ConditionInputKey, EnumMetadata<String>> conditionInputKey =
      {
    ConditionInputKey.targetPrice: EnumMetadata(value: 'targetPrice'),
    ConditionInputKey.targetVolume: EnumMetadata(value: 'targetVolume'),
    ConditionInputKey.targetPercentChange:
        EnumMetadata(value: 'targetPercentChange'),
  };
}
