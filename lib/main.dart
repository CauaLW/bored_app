import 'package:bored_app/application/pages/activity_idea/activity_idea_page.dart';
import 'package:flutter/material.dart';
import 'injection.dart' as dependencyInjection;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return MaterialApp(
      title: 'Bored App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent, brightness: Brightness.dark),
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: themeData.textTheme.titleMedium,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bored App'),
        ),
        body: const ActivityIdeaWrapperProvider(),
      ),
    );
  }
}
