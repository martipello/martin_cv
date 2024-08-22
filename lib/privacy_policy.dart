import 'package:flutter/material.dart';

import 'martins_drawer.dart';


const kPrivacyPolicyRoute = '/privacy_policy';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MartinsDrawer(),
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: const Column(
        children: <Widget>[
          Placeholder(),
        ],
      ),
    );
  }
}
