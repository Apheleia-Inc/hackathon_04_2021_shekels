import 'package:hackathon_04_2021_shekels/global/environment.dart';
import 'package:hackathon_04_2021_shekels/main.dart';

void main() {
  EnvironmentUtil.setEnvironment(Environment.dev);
  mainDelegate();
}
