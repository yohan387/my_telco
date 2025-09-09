part of 'main_screen.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final int currentPageIndex;
  final void Function(int)? onTap;
  const AppBottomNavigationBar({
    super.key,
    required this.currentPageIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 8, 0, 0).withOpacity(1),
                offset: const Offset(0, -16),
                blurRadius: 8,
                spreadRadius: 10,
              ),
            ],
          ),
          child: NavigationBar(
            selectedIndex: currentPageIndex,
            // backgroundColor: Colors.white,
            onDestinationSelected: onTap,
            // indicatorColor: AppColors.orangeGradiant2,
            // shadowColor: Colors.black,
            elevation: 32,

            destinations: [
              NavigationDestination(
                icon: AppSvgIcon(
                  icon: currentPageIndex == _PageIndex.dashboardPage
                      ? AppSvgIconsData.homeActive
                      : AppPngIconsData.homeInActive,
                  type: currentPageIndex == _PageIndex.dashboardPage
                      ? AppIconType.svg
                      : AppIconType.png,
                  withBackground: currentPageIndex == _PageIndex.dashboardPage,
                ),
                label: 'Accueil',
              ),
              NavigationDestination(
                icon: AppSvgIcon(
                  icon: currentPageIndex == _PageIndex.offersPage
                      ? AppSvgIconsData.offerActive
                      : AppSvgIconsData.offerInActive,
                  withBackground: currentPageIndex == _PageIndex.offersPage,
                ),
                label: 'Forfait',
              ),
              NavigationDestination(
                icon: AppSvgIcon(
                  icon: currentPageIndex == _PageIndex.subscriptionPage
                      ? AppSvgIconsData.subscriptionActif
                      : AppSvgIconsData.subscriptionInActive,
                  withBackground:
                      currentPageIndex == _PageIndex.subscriptionPage,
                ),
                label: 'Mes pass',
              ),
              NavigationDestination(
                icon: AppSvgIcon(
                  icon: currentPageIndex == _PageIndex.historyPage
                      ? AppSvgIconsData.historyActif
                      : AppSvgIconsData.historyInActive,
                  withBackground: currentPageIndex == _PageIndex.historyPage,
                ),
                label: 'Historique',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
