import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_example/core/shared/models/history.dart';
import 'package:instagram_example/core/utils/constants.dart';
import 'package:instagram_example/features/home/presentation/widgets/histories_instagram.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          HistoriesInstagram(histories: histories),
          const SliverToBoxAdapter(child: Text('Home')),
        ],
      ),
    );
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
