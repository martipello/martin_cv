// ignore_for_file: avoid-passing-async-when-sync-expected

import 'package:flutter/material.dart';
import 'package:martin_cv/margins.dart';

typedef NavCallback = void Function(int index);

class MartinsDrawer extends StatelessWidget {
  const MartinsDrawer({super.key, required this.onTap});

  final NavCallback onTap;

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
                      Scaffold.of(context).closeDrawer();
                      onTap(0);
                    },
                  ),
                  ListTile(
                    title: const Text('Privacy Policy'),
                    onTap: () {
                      Scaffold.of(context).closeDrawer();
                      onTap(1);
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
