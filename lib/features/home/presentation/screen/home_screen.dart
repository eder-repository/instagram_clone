import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_example/core/shared/models/history.dart';
import 'package:instagram_example/core/shared/widgets/sliver_custom_header_delegate.dart';
import 'package:instagram_example/core/utils/constants.dart';
import 'package:instagram_example/features/home/presentation/widgets/histories_instagram.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F1F5),
      body: CustomScrollView(
        slivers: [HistoriesInstagram(histories: histories), SearchHome()],
      ),
    );
  }
}

class SearchHome extends StatelessWidget {
  const SearchHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        delegate: SliverCustomHeaderDelegate(
            minHeight: 60,
            maxHeight: 70,
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xffF0F1F5),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Explorar',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Theme.of(context).cardColor,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        SvgPicture.asset('assets/search.svg',
                            color: Theme.of(context).colorScheme.primary),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CupertinoTextField(
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(fontSize: 18),
                            cursorColor: Theme.of(context).hintColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key, this.home = true}) : super(key: key);

  final bool home;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight * 1.5,
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            'assets/add.svg',
            color: Theme.of(context).textTheme.bodyText1!.color,
          ),
          SvgPicture.asset(
            'assets/banner.svg',
            color: Theme.of(context).textTheme.bodyText1!.color,
          ),
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                'assets/chat.svg',
                color: Theme.of(context).textTheme.bodyText1!.color,
              ),
              if (home)
                const Positioned(
                    right: -5,
                    top: -5,
                    child: CircleAvatar(
                      radius: 7.5,
                      backgroundColor: ColorsInsta.pink,
                      child: Text(
                        '2',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                    ))
            ],
          ),
        ],
      ),
    );
  }
}
