import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:hackathon_04_2021_shekels/global/dot_env.dart';

Future<void> initDotEnv() async {
  await DotEnv.load(fileName: '.env');
  DotEnvUtils.setDotEnvConfigs(DotEnv.env);
}
