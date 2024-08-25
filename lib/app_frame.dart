import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:martin_cv/extensions/media_query_context_extension.dart';
import 'package:martin_cv/widgets/martins_drawer.dart';

const kPitchInFrame = 'PitchIn';

class AppFrame extends StatelessWidget {
  const AppFrame({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final isWideLayout = MediaQuery.of(context).isLargeScreen;
    return Material(
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (isWideLayout) {
              return _buildScaffoldWithNavigatorRail(context);
            }
            return _buildScaffoldWithNavigationDrawer(context);
          },
        ),
      ),
    );
  }

  Widget _buildScaffoldWithNavigatorRail(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.privacy_tip_outlined),
                label: Text('Privacy Policy'),
              ),
            ],
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: onTap,
          ),
          Expanded(
            child: navigationShell,
          ),
        ],
      ),
    );
  }

  Widget _buildScaffoldWithNavigationDrawer(BuildContext context) {
    return Scaffold(
      appBar: navigationShell.currentIndex != 0 ? AppBar(
        title: const Text('Seal Studios'),
      ) : null,
      drawer: MartinsDrawer(onTap: onTap),
      body: navigationShell,
    );
  }

  void onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
