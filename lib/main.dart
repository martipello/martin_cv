import 'package:flutter/material.dart';
import 'package:martin_cv/extensions/media_query_context_extension.dart';
import 'package:martin_cv/home/home_page_content.dart';
import 'package:martin_cv/navigation_config.dart';
import 'package:martin_cv/theme/theme.g.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: kLightTheme,
      darkTheme: kDarkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (nestedContext, innerScroll) {
        return [
          _buildSliverHeader(nestedContext),
        ];
      },
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Builder(
      builder: (context) {
        return CustomScrollView(
          slivers: [
            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            const SliverToBoxAdapter(
              child: HomePageContent(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSliverHeader(BuildContext nestedContext) {
    final isLargeScreen = MediaQuery.of(context).isLargeScreen;
    final headerHeight = isLargeScreen ? 400.0 : 200.0;
    final logoHeight = isLargeScreen ? 250.0 : 100.0;
    return SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(nestedContext),
      sliver: SliverAppBar(
        pinned: true,
        expandedHeight: headerHeight,
        flexibleSpace: FlexibleSpaceBar(
          title: SafeArea(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                'assets/images/seal_studios_logo.png',
                height: logoHeight,
              ),
            ),
          ),
          titlePadding: const EdgeInsets.all(8),
          background: _buildHeader(),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    final isLargeScreen = MediaQuery.of(context).isLargeScreen;
    final headerHeight = isLargeScreen ? 400.0 : 200.0;
    return ConstrainedBox(
      constraints: BoxConstraints.expand(
        height: headerHeight,
      ),
      child: Image.asset(
        width: double.infinity,
        height: headerHeight,
        'assets/images/header_image.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
