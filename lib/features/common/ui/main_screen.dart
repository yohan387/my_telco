import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_telco/features/common/states/app_path_cubit/app_path_cubit.dart';
import 'package:my_telco/features/common/ui/app_common_navigation_bar.dart';
import 'package:my_telco/features/common/ui/app_icon.dart';
import 'package:my_telco/core/constants/assets.dart';
import 'package:my_telco/core/constants/enums.dart';
import 'package:my_telco/core/constants/style.dart';
import 'package:my_telco/features/dashboard/ui/pages/dashboard.dart';
import 'package:my_telco/features/history/ui/pages/history_page.dart';
import 'package:my_telco/features/offer/ui/pages/offer_page.dart';
import 'package:my_telco/features/pass/ui/pages/pass_page.dart';

part 'bottom_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final AppPathCubit _cubit;
  bool _canPop = false;
  final List<Widget> _pages = const [
    DashboardPage(),
    OfferPage(),
    PassPage(),
    HistoryPage(),
  ];

  @override
  void initState() {
    super.initState();
    _cubit = context.read<AppPathCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppPathCubit, AppPathState>(
      builder: (context, state) {
        return PopScope(
          canPop: _canPop,
          onPopInvoked: (didPop) {
            if (state.stackLength > 1) {
              setState(() => _canPop = false);
              _cubit.popPage();
            } else if (state.stackLength == 1 && !state.isOnHomePage) {
              setState(() => _canPop = false);
              _cubit.setTab(0);
            } else if (state.stackLength == 1 && state.isOnHomePage) {
              setState(() => _canPop = true);
            }
          },
          child: Scaffold(
            appBar: _buildAppBar(state.currentTabIndex),
            body: IndexedStack(
              index: state.currentTabIndex,
              children: _pages,
            ),
            bottomNavigationBar: AppBottomNavigationBar(
              currentPageIndex: state.currentTabIndex,
              onTap: _cubit.setTab,
            ),
          ),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar(int currentTabIndex) {
    switch (currentTabIndex) {
      case _PageIndex.dashboardPage:
        return AppBar();

      default:
        return const AppCommonNavigationBar();
    }
  }
}

abstract final class _PageIndex {
  static const int dashboardPage = 0;
  static const int offersPage = 1;
  static const int subscriptionPage = 2;
  static const int historyPage = 3;
}
