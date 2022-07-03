import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState.initialState) {
    on<OnChangeIndex>(_onChangeCurrentIndex);
  }

  FutureOr<void> _onChangeCurrentIndex(
      OnChangeIndex event, Emitter<NavigationState> emit) {
    emit(state.copyWith(currentIndex: event.currentIndex));
  }
}
