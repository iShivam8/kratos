import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@immutable
class TabIndexState {
  final int currentPageIndex;

  const TabIndexState({this.currentPageIndex = 0});

  TabIndexState copyWith({int? currentPageIndex}) {
    return TabIndexState(
        currentPageIndex: currentPageIndex ?? this.currentPageIndex);
  }
}

class TabIndexStateNotifier extends StateNotifier<TabIndexState> {
  TabIndexStateNotifier() : super(const TabIndexState());

  void setCurrentPageIndex(int index) {
    state = state.copyWith(currentPageIndex: index);
  }
}

final tabIndexStateNotifierProvider =
    StateNotifierProvider<TabIndexStateNotifier, TabIndexState>(
  (ref) => TabIndexStateNotifier(),
);
