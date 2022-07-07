import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_example/core/shared/bloc/bloc/navigation_bloc.dart';
import 'package:instagram_example/core/shared/widgets/navigation_button.dart';
import 'package:instagram_example/features/home/presentation/screen/home_screen.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Theme.of(context).brightness,
    ));
    return BlocSelector<NavigationBloc, NavigationState, int>(
      selector: (state) => state.currentIndex,
      builder: (context, currentIndex) {
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: preferredSize,
              child: CustomAppbar(
                home: currentIndex == 0,
              )),
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Stack(
            children: [
              IndexedStack(
                index: currentIndex,
                children: [
                  const HomeScreen(),
                  Container(
                    color: Colors.yellow,
                  ),
                  Container(
                    color: Colors.blue,
                  ),
                  Container(
                    color: Colors.green,
                  ),
                  Container(
                    color: Colors.red,
                  )
                ],
              ),
              const NavigationButton()
            ],
          ),
        );
      },
    );
  }

  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
