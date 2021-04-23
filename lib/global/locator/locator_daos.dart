import 'package:hackathon_04_2021_shekels/core/database/daos/implements/theme_dao.dart';
import 'package:hackathon_04_2021_shekels/core/database/daos/interfaces/itheme_dao.dart';
import 'package:hackathon_04_2021_shekels/global/locator/locator.dart';

void setupDaos() {
  locator.registerLazySingleton<IThemeDao>(() => ThemeDao());
}
