// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:instagram_example/core/shared/models/history.dart';
import 'package:instagram_example/core/utils/constants.dart';

class HistoriesInstagram extends StatelessWidget {
  const HistoriesInstagram({
    Key? key,
    this.featuredStories = false,
    required this.histories,
  }) : super(key: key);

  final bool featuredStories;
  final List<History> histories;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      sliver: SliverToBoxAdapter(
          child: Container(
        height: 100,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: histories.length,
          itemBuilder: (context, index) => _ItemHistory(
            history: histories[index],
            isFirst: index == 0,
            featuredStories: featuredStories,
            primary: index == 0,
          ),
        ),
      )),
    );
  }
}

class _ItemHistory extends StatelessWidget {
  const _ItemHistory({
    Key? key,
    this.isFirst = false,
    required this.history,
    required this.featuredStories,
    required this.primary,
  }) : super(key: key);

  final bool isFirst;
  final bool featuredStories;
  final History history;
  final bool primary;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 85,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                UserAvatar(
                  isFirst: isFirst,
                  image: history.image,
                ),
                if (isFirst)
                  Positioned(
                      left: 0,
                      right: 0,
                      bottom: -13,
                      child: CircleAvatar(
                          radius: 14,
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          child: Container(
                            alignment: Alignment.center,
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomRight,
                                    colors: const [
                                      ColorsInsta.pink,
                                      ColorsInsta.purple
                                    ],
                                    stops: const [
                                      .3,
                                      1
                                    ])),
                            child: Icon(
                              Icons.add,
                              size: 18,
                            ),
                          ))),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Text(primary ? '' : history.title,
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.caption!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color:
                          featuredStories ? Theme.of(context).hintColor : null,
                    )),
          ],
        ),
      ),
    );
  }
}

class UserAvatar extends StatelessWidget {
  const UserAvatar(
      {Key? key, this.isFirst = false, required this.image, this.radius = 35})
      : super(key: key);

  final bool isFirst;
  final String image;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isFirst ? Theme.of(context).colorScheme.secondary : null,
        gradient: !isFirst
            ? LinearGradient(
                colors: const [ColorsInsta.pink, ColorsInsta.purple],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            : null,
      ),
      padding: EdgeInsets.all(2),
      child: ClipOval(
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
