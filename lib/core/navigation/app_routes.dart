import 'package:flutter/material.dart';
import 'package:instagram_example/core/navigation/routes.dart';
import 'package:instagram_example/features/home/presentation/screen/home_screen.dart';
import 'package:instagram_example/home_main.dart';

Map<String, Widget Function(BuildContext)> get appRoutes => {
      AppRoutes.home: (_) => const HomeMain(),
      AppRoutes.homeScreen: (_) => const HomeScreen(),
    };
