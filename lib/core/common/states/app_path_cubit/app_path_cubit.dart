import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_telco/core/constants/menus_title.dart';

part 'app_path_state.dart';

class AppPathCubit extends Cubit<AppPathState> {
  AppPathCubit()
      : super(
          const AppPathState(
            currentTabIndex: 0,
            stacks: [
              [AppMenusTitle.home],
              [AppMenusTitle.offers],
              [AppMenusTitle.subscriptions],
              [AppMenusTitle.history],
            ],
          ),
        );

  void setTab(int index) {
    if (index != state.currentTabIndex) {
      emit(state.copyWith(currentTabIndex: index));
    }
  }

  void pushPage(String page) {
    final newStacks = List<List<String>>.from(state.stacks);
    newStacks[state.currentTabIndex] =
        List<String>.from(newStacks[state.currentTabIndex])..add(page);
    emit(state.copyWith(stacks: newStacks));
  }

  void popPage() {
    final currentStack = state.stacks[state.currentTabIndex];
    if (currentStack.length > 1) {
      final newStacks = List<List<String>>.from(state.stacks);
      newStacks[state.currentTabIndex] = List<String>.from(currentStack)
        ..removeLast();
      emit(state.copyWith(stacks: newStacks));
    }
  }
}
