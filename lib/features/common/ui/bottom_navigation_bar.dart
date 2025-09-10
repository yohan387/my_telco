part of 'main_screen.dart';

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
                color: const Color.fromARGB(255, 8, 0, 0).withOpacity(1),
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
                  imgPath: currentPageIndex == _PageIndex.dashboardPage
                      ? AppAssetsSvgIcons.homeOrange
                      : AppAssetsPngIcons.home,
                  color: currentPageIndex == _PageIndex.dashboardPage
                      ? _iconColor
                      : null,
                  type: currentPageIndex == _PageIndex.dashboardPage
                      ? AppIconType.svg
                      : AppIconType.png,
                ),
                label: 'Accueil',
              ),
              NavigationDestination(
                icon: AppIcon(
                  imgPath: currentPageIndex == _PageIndex.offersPage
                      ? AppAssetsSvgIcons.offerOrange
                      : AppAssetsSvgIcons.offer,
                  color: currentPageIndex == _PageIndex.offersPage
                      ? _iconColor
                      : null,
                ),
                label: 'Forfait',
              ),
              NavigationDestination(
                icon: AppIcon(
                  imgPath: currentPageIndex == _PageIndex.subscriptionPage
                      ? AppAssetsSvgIcons.passOrange
                      : AppAssetsSvgIcons.pass,
                  color: currentPageIndex == _PageIndex.subscriptionPage
                      ? _iconColor
                      : null,
                ),
                label: 'Mes pass',
              ),
              NavigationDestination(
                icon: AppIcon(
                  imgPath: currentPageIndex == _PageIndex.historyPage
                      ? AppAssetsSvgIcons.historyOrange
                      : AppAssetsSvgIcons.history,
                  color: currentPageIndex == _PageIndex.historyPage
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
