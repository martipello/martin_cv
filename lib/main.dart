import 'package:flutter/material.dart';
import 'package:martin_cv/extensions/context_extensions.dart';
import 'package:martin_cv/extensions/media_query_context_extension.dart';
import 'package:martin_cv/navigation_config.dart';
import 'package:martin_cv/theme/theme.g.dart';
import 'package:martin_cv/widgets/view_constraint.dart';

import 'margins.dart';
import 'widgets/martins_drawer.dart';

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
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverToBoxAdapter(
                child: ViewConstraint(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      kMediumMargin,

                      Text(
                        'Welcome to Seal Studios',
                        style: context.text.titleLarge,
                      ),
                      kMediumMargin,
                      Text(
                        'We are a team of developers who are passionate about creating high-quality software. We are dedicated to providing the best possible service to our clients and we are always looking for new ways to improve our products.',
                        style: context.text.bodyLarge,
                      ),
                      kMediumMargin,
                      Text(
                        'Our team is made up of experienced professionals who have worked on a wide range of projects, from small websites to large enterprise applications. We have the skills and expertise to handle any project, no matter how big or small.',
                        style: context.text.bodyLarge,
                      ),
                      kMediumMargin,
                      Text(
                        'This application is under construction',
                        style: context.text.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
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
