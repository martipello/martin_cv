// ignore_for_file: avoid-passing-async-when-sync-expected

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:martin_cv/margins.dart';
import 'package:martin_cv/navigation_config.dart';
import 'package:martin_cv/privacy_policy.dart';

class MartinsDrawer extends StatelessWidget {
  const MartinsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          kMediumMargin,
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Seal Studios',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    title: const Text('Home'),
                    onTap: () {
                      context.go(kHomeRoute);
                    },
                  ),
                  ListTile(
                    title: const Text('Privacy Policy'),
                    onTap: () {
                      context.go(kPrivacyPolicyRoute);
                    },
                  ),
                ],
              ),
            ),
          ),
          const Column(
            children: [
              Divider(
                thickness: 2,
                indent: 16,
                endIndent: 16,
                height: 2,
              ),
              kLargeMargin,
              Text('Version 1.0.0'),
              kLargeMargin,
            ],
          ),
        ],
      ),
    );
  }
}
