import 'package:flutter/material.dart';
import 'package:martin_cv/extensions/context_extensions.dart';

class MartinsExpansionTile<T> extends StatelessWidget {
  const MartinsExpansionTile({
    super.key,
    required this.title,
    required this.children,
    this.initiallyExpanded = false,
  });

  final Widget title;
  final List<Widget> children;
  final bool initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedBackgroundColor: context.colors.surface,
      backgroundColor: context.colors.surface,
      expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
      tilePadding: const EdgeInsets.symmetric(horizontal: 16),
      shape: _buildRoundedRectangleBorder(context),
      collapsedShape: _buildRoundedRectangleBorder(context),
      childrenPadding: const EdgeInsets.only(
        bottom: 16,
      ),
      title: title,
      initiallyExpanded: initiallyExpanded,
      children: children,
    );
  }

  RoundedRectangleBorder _buildRoundedRectangleBorder(BuildContext context) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    );
  }
}
