part of 'app_path_cubit.dart';

class AppPathState extends Equatable {
  final int currentTabIndex;
  final List<List<String>> stacks;

  const AppPathState({
    required this.currentTabIndex,
    required this.stacks,
  });

  AppPathState copyWith({
    int? currentTabIndex,
    List<List<String>>? stacks,
  }) {
    return AppPathState(
      currentTabIndex: currentTabIndex ?? this.currentTabIndex,
      stacks: stacks ?? this.stacks,
    );
  }

  String get currentPage => stacks[currentTabIndex].last;

  int get stackLength => stacks[currentTabIndex].length;

  bool get isOnHomePage => currentPage == AppMenus.home;

  @override
  List<Object?> get props => [
        currentTabIndex,
        stacks,
        stacks.length,
        stacks[currentTabIndex].length,
        stacks[currentTabIndex],
      ];
}
