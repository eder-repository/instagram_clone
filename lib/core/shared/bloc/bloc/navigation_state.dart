part of 'navigation_bloc.dart';

class NavigationState extends Equatable {
  const NavigationState({required this.currentIndex});
  final int currentIndex;

  static get initialState => const NavigationState(currentIndex: 0);

  NavigationState copyWith({required int currentIndex}) =>
      NavigationState(currentIndex: currentIndex);

  @override
  List<Object> get props => [currentIndex];
}
