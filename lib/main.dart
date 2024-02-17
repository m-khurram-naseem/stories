import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stories/firebase_options.dart';
import 'package:stories/flow/story_feed/view/home_page.dart';
import 'package:stories/navigation/route_generation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const _appTitle = 'Stories';
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: HomePage.pageName,
      onGenerateRoute: RouteGeneration.onGenerateRoute,
    );
  }
}
