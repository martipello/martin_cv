import 'package:flutter/material.dart';
import 'package:martin_cv/margins.dart';
import 'package:martin_cv/navigation_config.dart';
import 'package:martin_cv/theme/theme.g.dart';

import 'martins_drawer.dart';

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
    return Scaffold(
      appBar: AppBar(),
      drawer: const MartinsDrawer(),
      body: Column(
        children: <Widget>[
          _buildHeader(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(height: 400),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          OverflowBox(
            child: Image.asset(
              width: double.infinity,
              height: 400,
              'assets/images/header_image.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                'assets/images/seal_studios_logo.png',
              ),
              kXLargeMargin,
            ],
          ),
        ],
      ),
    );
  }
}
