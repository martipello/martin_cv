import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:martin_cv/privacy_policy/poke_app_dex_privacy_policy_html.dart';
import 'package:martin_cv/widgets/martins_expansion_tile.dart';
import 'package:martin_cv/widgets/view_constraint.dart';

import 'widgets/martins_drawer.dart';

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
      body: const ViewConstraint(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    MartinsExpansionTile(
                      title: Text('PokeAppDex'),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: HtmlWidget(kPokeAppDexPrivacyPolicyHtml),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
