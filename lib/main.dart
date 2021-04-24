import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon_04_2021_shekels/core/viewmodels/viewmodel_providers.dart';
import 'package:hackathon_04_2021_shekels/global/app_router.dart';
import 'package:hackathon_04_2021_shekels/global/environment.dart';
import 'package:hackathon_04_2021_shekels/startups/init_firebase.dart';
import 'package:hackathon_04_2021_shekels/startups/init_locator.dart';
import 'package:hackathon_04_2021_shekels/startups/init_precache_images.dart';
import 'package:hackathon_04_2021_shekels/utils/navigation_utils.dart';
import 'package:provider/provider.dart';

void main() {
  EnvironmentUtil.setEnvironment(Environment.dev);
  mainDelegate();
}

Future<void> mainDelegate() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Pre-init
  await setupLocator();
  await initPrecacheImages();
  await initFirebase();

  runApp(
    _MyApp(),
  );
}

class _MyApp extends StatefulWidget {
  _MyApp({Key key}) : super(key: key);

  @override
  __MyAppState createState() => __MyAppState();
}

class __MyAppState extends State<_MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [...viewmodelProviders],
      child: GetMaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        debugShowCheckedModeBanner: false,
        navigatorKey: NavigationUtils.navigatorKey,
        onGenerateRoute: (settings) => MyRouterUtils.generateRoute(settings),
        initialRoute: AppRouter.splash,
      ),
    );
  }
}
