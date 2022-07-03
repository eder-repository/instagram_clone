import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_example/core/shared/bloc/bloc/navigation_bloc.dart';
import 'package:instagram_example/core/utils/constants.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationBloc = BlocProvider.of<NavigationBloc>(context);
    final size = MediaQuery.of(context).size;
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: kBottomNavigationBarHeight,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(20)),
          child: BlocSelector<NavigationBloc, NavigationState, int>(
            selector: (state) => state.currentIndex,
            builder: (_, currentIndex) {
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      imageItems.length,
                      (i) => CupertinoButton(
                        child: (i == 4)
                            ? CircleAvatar(
                                radius: 11,
                                backgroundColor: (currentIndex == i)
                                    ? ColorsInsta.pink
                                    : Colors.transparent,
                                child: CircleAvatar(
                                    radius: 9,
                                    backgroundImage: AssetImage(imageItems[i])),
                              )
                            : (i == 2)
                                ? const SizedBox.shrink()
                                : SvgPicture.asset(imageItems[i],
                                    color: currentIndex == i
                                        ? ColorsInsta.pink
                                        : ColorsInsta.grey),
                        onPressed: () => (i != 2)
                            ? navigationBloc.add(OnChangeIndex(currentIndex: i))
                            : null,
                      ),
                    ),
                  ),
                  Positioned(
                      left: (size.width / 2) - (sizeGlobal / 2),
                      right: (size.width / 2) - (sizeGlobal / 2),
                      top: -35,
                      child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => navigationBloc
                            .add(const OnChangeIndex(currentIndex: 2)),
                        child: Container(
                          height: sizeGlobal,
                          width: sizeGlobal,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomRight,
                                colors: [
                                  ColorsInsta.purple,
                                  ColorsInsta.pink,
                                  ColorsInsta.orange
                                ],
                                stops: [
                                  .1,
                                  .5,
                                  1
                                ]),
                          ),
                          padding: const EdgeInsets.all(15),
                          child: SvgPicture.asset(imageItems[2]),
                        ),
                      ))
                ],
              );
            },
          ),
        ));
  }
}
