import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_telco/core/constants/app_tab_page_index.dart';

import 'package:my_telco/features/common/states/app_path_cubit/app_path_cubit.dart';
import 'package:my_telco/features/common/ui/widgets/app_bar.dart';
import 'package:my_telco/features/common/ui/widgets/app_icon.dart';
import 'package:my_telco/core/constants/assets.dart';
import 'package:my_telco/core/constants/enums.dart';
import 'package:my_telco/core/constants/style.dart';
import 'package:my_telco/features/dashboard/ui/pages/dashboard.dart';
import 'package:my_telco/features/dashboard/ui/widgets/dashboard_app_bar.dart';
import 'package:my_telco/features/history/ui/pages/history_page.dart';
import 'package:my_telco/features/offer/ui/pages/offer_page.dart';
import 'package:my_telco/features/pass/ui/pages/pass_page.dart';

part 'widgets/bottom_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final AppPathCubit _cubit;

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
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (state.stackLength > 1) {
              _cubit.popPage();
            } else if (state.stackLength == 1 && !state.isOnHomePage) {
              _cubit.setTab(0);
            } else if (state.stackLength == 1 && state.isOnHomePage) {
              SystemNavigator.pop();
            }
          },

          child: Scaffold(
            appBar: _buildAppBar(state.currentTabIndex),
            body: _pages[state.currentTabIndex],
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
      case AppTabPageIndex.dashboardPage:
        return const DashboardAppBar();

      default:
        return const AppCommonNavigationBar();
    }
  }
}
