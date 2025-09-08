import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_telco/core/common/app_icon.dart';
import 'package:my_telco/core/common/states/app_path_cubit/app_path_cubit.dart';
import 'package:my_telco/core/constants/app_constant.dart';
import 'package:my_telco/features/dashboard/ui/pages/dashboard.dart';
import 'package:my_telco/features/history/ui/pages/history_page.dart';
import 'package:my_telco/features/offers/ui/pages/offers_page.dart';
import 'package:my_telco/features/subscriptions/ui/pages/subscription_page.dart';

part 'bottom_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _pages = const [
    DashboardPage(),
    OffersPage(),
    SubscriptionPage(),
    HistoryPage(),
  ];

  bool _canPop = false;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppPathCubit>();

    return BlocBuilder<AppPathCubit, AppPathState>(
      builder: (context, state) {
        final isOnHomePage = cubit.state.currentPage == AppMenusTitle.home;
        final stackLength = cubit.state.stacks[state.currentTabIndex].length;
        return PopScope(
          canPop: _canPop,
          onPopInvoked: (didPop) {
            if (stackLength > 1) {
              setState(() => _canPop = false);
              cubit.popPage();
            } else if (stackLength == 1 && !isOnHomePage) {
              setState(() => _canPop = false);
              cubit.setTab(0);
            } else if (stackLength == 1 && isOnHomePage) {
              setState(() => _canPop = true);
            }
          },
          child: Scaffold(
            appBar: _buildAppBar(state),
            body: IndexedStack(
              index: state.currentTabIndex,
              children: _pages,
            ),
            bottomNavigationBar: AppBottomNavigationBar(
              currentPageIndex: state.currentTabIndex,
              onTap: cubit.setTab,
            ),
          ),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar(AppPathState state) {
    switch (state.currentTabIndex) {
      case _PageIndex.dashboardPage:
        return AppBar();

      default:
        return AppBar(title: Text(state.currentPage));
    }
  }
}

class _PageIndex {
  static const int dashboardPage = 0;
  static const int offersPage = 1;
  static const int subscriptionPage = 2;
  static const int historyPage = 3;
}
