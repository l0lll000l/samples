import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_5/screen/home_page.dart';
import 'package:flutter_application_5/secrets/weather_service.dart';
import 'package:flutter_application_5/services/location_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocationProvider()),
        ChangeNotifierProvider(create: (context) => WeatherserviceProvider()),
      ],
      child: MaterialApp(
          title: 'weather app',
          theme: ThemeData(
            useMaterial3: true,
          ),
          home: const HomePage()),
    );
  }
}
