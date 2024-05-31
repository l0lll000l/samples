import 'dart:async';

import 'package:apidemo/applications/bloc/trending_bloc.dart';
import 'package:apidemo/constant/constant.dart';
import 'package:apidemo/domain/injectable/injectable.dart';
import 'package:apidemo/home/screen_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<TrendingBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: backgroundcolor,
        ),
        home: const ScreenHome(),
      ),
    );
  }
}
