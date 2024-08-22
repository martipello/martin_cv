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
          kXLargeMargin,
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Seal Studios',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          kSmallMargin,
          _buildDivider(),
          kSmallMargin,
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
          Column(
            children: [
              _buildDivider(),
              kLargeMargin,
              const Text('Version 1.0.0'),
              kLargeMargin,
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      thickness: 2,
      indent: 16,
      endIndent: 16,
      height: 2,
    );
  }
}
