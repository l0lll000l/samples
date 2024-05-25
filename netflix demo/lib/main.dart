import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/application/FastLaugh/fast_laugh_bloc.dart';
import 'package:netflix/application/downloads/download/downloads_bloc.dart';
import 'package:netflix/application/home/bloc/trending_bloc.dart';
import 'package:netflix/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix/application/search/search/search_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/domain/downloads/core/injectable.dart';

import 'package:netflix/presentation/mainPage/widgets/screen_main_age.dart';

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
        BlocProvider(create: (ctx) => getIt<DownloadsBloc>()),
        BlocProvider(create: (ctx) => getIt<SearchBloc>()),
        BlocProvider(create: (ctx) => getIt<FastLaughBloc>()),
        BlocProvider(create: (ctx) => getIt<HotAndNewBloc>()),
        BlocProvider(create: (ctx) => getIt<TrendingBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'netflix',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          colorScheme: backgroundcolor,
          fontFamily: GoogleFonts.montserrat().fontFamily,
          textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.white),
              bodyMedium: TextStyle(color: Colors.white)),
        ),
        home: ScreeenMainPage(),
      ),
    );
  }
}
