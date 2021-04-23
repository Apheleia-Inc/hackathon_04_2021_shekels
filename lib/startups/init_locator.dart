import 'package:hackathon_04_2021_shekels/global/global_data.dart';
import 'package:hackathon_04_2021_shekels/global/locator/locator.dart';
import 'package:hackathon_04_2021_shekels/global/locator/locator_daos.dart';
import 'package:hackathon_04_2021_shekels/global/locator/locator_rest_client.dart';
import 'package:hackathon_04_2021_shekels/global/locator/locator_services.dart';

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => GlobalData());

  setupRestClient();
  setupDaos();
  setupServices();
}
