import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stories/firebase_options.dart';
import 'package:stories/flow/option_dialog/view/option_dialog.dart';
import 'package:stories/flow/story_feed/view/home_page.dart';
import 'package:stories/navigation/route_generation.dart';
import 'package:stories/services/local_notification_service.dart';
import 'package:stories/util/app_constants/preference_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  LocalNotificationService().initialize();
  FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
  SharedPreferences preferences = await SharedPreferences.getInstance();
  GetIt.I.registerSingleton<SharedPreferences>(preferences);
  runApp(const MyApp());
}

@pragma('vm:entry-point')
Future<void> _onBackgroundMessage(RemoteMessage message) async {
  await Firebase.initializeApp();
  return Future.value(null);
}

class MyApp extends StatelessWidget {
  static const _appTitle = 'Stories';
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      initialRoute:
          (GetIt.I<SharedPreferences>().getBool(Preferences.categoriesKey) ??
                  true)
              ? OptionDialogPage.pageName
              : HomePage.pageName,
      onGenerateRoute: RouteGeneration.onGenerateRoute,
    );
  }
}
