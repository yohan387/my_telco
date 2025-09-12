part of '../main_screen.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final int currentPageIndex;
  final void Function(int)? onTap;
  const AppBottomNavigationBar({
    super.key,
    required this.currentPageIndex,
    required this.onTap,
  });

  static const _iconColor = AppColors.orangeGradiant2;

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
                color: const Color.fromARGB(255, 8, 0, 0).withAlpha(10),
                offset: const Offset(0, -16),
                blurRadius: 8,
                spreadRadius: 10,
              ),
            ],
          ),
          child: NavigationBar(
            selectedIndex: currentPageIndex,
            onDestinationSelected: onTap,
            elevation: 32,
            destinations: [
              NavigationDestination(
                icon: AppIcon(
                  imgPath:
                      currentPageIndex == AppTabPageIndex.dashboardPage
                          ? AppAssetsSvgIcons.homeOrange
                          : AppAssetsPngIcons.home,
                  color:
                      currentPageIndex == AppTabPageIndex.dashboardPage
                          ? _iconColor
                          : null,
                  type:
                      currentPageIndex == AppTabPageIndex.dashboardPage
                          ? AppIconType.svg
                          : AppIconType.png,
                ),
                label: 'Accueil',
              ),
              NavigationDestination(
                icon: AppIcon(
                  imgPath:
                      currentPageIndex == AppTabPageIndex.offersPage
                          ? AppAssetsSvgIcons.offerOrange
                          : AppAssetsSvgIcons.offer,
                  color:
                      currentPageIndex == AppTabPageIndex.offersPage
                          ? _iconColor
                          : null,
                ),
                label: 'Forfait',
              ),
              NavigationDestination(
                icon: AppIcon(
                  imgPath:
                      currentPageIndex == AppTabPageIndex.subscriptionPage
                          ? AppAssetsSvgIcons.passOrange
                          : AppAssetsSvgIcons.pass,
                  color:
                      currentPageIndex == AppTabPageIndex.subscriptionPage
                          ? _iconColor
                          : null,
                ),
                label: 'Mes pass',
              ),
              NavigationDestination(
                icon: AppIcon(
                  imgPath:
                      currentPageIndex == AppTabPageIndex.historyPage
                          ? AppAssetsSvgIcons.historyOrange
                          : AppAssetsSvgIcons.history,
                  color:
                      currentPageIndex == AppTabPageIndex.historyPage
                          ? _iconColor
                          : null,
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
