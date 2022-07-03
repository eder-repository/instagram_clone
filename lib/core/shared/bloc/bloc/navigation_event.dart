part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class OnChangeIndex extends NavigationEvent {
  const OnChangeIndex({
    required this.currentIndex,
  });

  final int currentIndex;
}
