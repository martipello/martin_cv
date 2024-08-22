import 'package:flutter/material.dart';

import '../extensions/media_query_context_extension.dart';

class ViewConstraint extends StatelessWidget {
  const ViewConstraint({
    super.key,
    required this.child,
    this.constraints,
  });

  final Widget child;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(),
        constraints: constraints ??
            const BoxConstraints(
              maxWidth: kMaxScreenWidth,
            ),
        child: child,
      ),
    );
  }
}
