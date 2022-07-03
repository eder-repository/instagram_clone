import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_example/core/navigation/app_routes.dart';
import 'package:instagram_example/core/navigation/routes.dart';
import 'package:instagram_example/core/shared/bloc/bloc/navigation_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => NavigationBloc())],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.home,
        routes: appRoutes,
      ),
    );
  }
}
