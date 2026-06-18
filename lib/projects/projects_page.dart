import 'package:flutter/material.dart';
import 'package:martin_cv/extensions/context_extensions.dart';
import 'package:martin_cv/widgets/view_constraint.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'project_data.dart';

const kProjectsRoute = '/projects';

// ---------------------------------------------------------------------------
// Page
// ---------------------------------------------------------------------------

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(
            child: ViewConstraint(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Text('My Projects', style: context.text.headlineMedium),
                  const SizedBox(height: 6),
                  Text(
                    'A selection of things I\'ve built',
                    style: context.text.bodyMedium?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withValues(alpha: 0.5),
                    ),
                  ),
                  const SizedBox(height: 40),
                  for (final project in kProjects)
                    _ProjectCard(project: project),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Card
// ---------------------------------------------------------------------------

class _ProjectCard extends StatefulWidget {
  const _ProjectCard({required this.project});

  final ProjectInfo project;

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final project = widget.project;
    final cs = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: Container(
        decoration: BoxDecoration(
          color: Color.alphaBlend(
            project.primaryColor.withValues(alpha: 0.06),
            cs.surface,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: project.primaryColor.withValues(alpha: 0.22),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: project.primaryColor.withValues(alpha: 0.18),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHero(context, project),
              _buildBody(context, project),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHero(BuildContext context, ProjectInfo project) {
    return SizedBox(
      height: 168,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Gradient background
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    project.primaryColor,
                    project.primaryColor.withValues(alpha: 0.65),
                  ],
                ),
              ),
            ),
          ),
          // Subtle bottom fade into card body
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 48,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0),
                    Colors.black.withValues(alpha: 0.18),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 24,
            top: 24,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  project.imagePath,
                  width: 76,
                  height: 76,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Name, tagline, platform badges
          Positioned(
            left: 116,
            right: 20,
            top: 24,
            bottom: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.3,
                    shadows: [Shadow(blurRadius: 8, color: Colors.black38)],
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  project.tagline,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.85),
                    fontSize: 13,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: project.platforms.map(_platformBadge).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context, ProjectInfo project) {
    final primary = project.primaryColor;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Description with read more
          AnimatedSize(
            duration: const Duration(milliseconds: 320),
            curve: Curves.easeInOut,
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedCrossFade(
                  duration: const Duration(milliseconds: 260),
                  crossFadeState: _expanded
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  firstChild: Text(
                    project.description,
                    style: context.text.bodyLarge?.copyWith(height: 1.65),
                  ),
                  secondChild: Text(
                    project.fullDescription,
                    style: context.text.bodyLarge?.copyWith(height: 1.7),
                  ),
                ),
                const SizedBox(height: 6),
                GestureDetector(
                  onTap: () => setState(() => _expanded = !_expanded),
                  child: Text(
                    _expanded ? 'Show less' : 'Read more',
                    style: context.text.bodyMedium?.copyWith(
                      color: primary,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationColor: primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          // Tech tags
          Wrap(
            spacing: 7,
            runSpacing: 7,
            children: project.techTags
                .map(
                  (tag) => Chip(
                    label: Text(tag, style: const TextStyle(fontSize: 12)),
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 20),
          // Links
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              if (project.websiteUrl != null)
                FilledButton.icon(
                  icon: const Icon(Icons.language_rounded, size: 17),
                  label: const Text('Website'),
                  style: FilledButton.styleFrom(
                    backgroundColor: primary,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () => launchUrlString(project.websiteUrl!),
                ),
              if (project.playStoreUrl != null)
                OutlinedButton.icon(
                  icon: const Icon(Icons.android_rounded, size: 17),
                  label: const Text('Play Store'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: primary,
                    side: BorderSide(color: primary.withValues(alpha: 0.6)),
                  ),
                  onPressed: () => launchUrlString(project.playStoreUrl!),
                ),
              if (project.appStoreUrl != null)
                OutlinedButton.icon(
                  icon: const Icon(Icons.apple_rounded, size: 17),
                  label: const Text('App Store'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: primary,
                    side: BorderSide(color: primary.withValues(alpha: 0.6)),
                  ),
                  onPressed: () => launchUrlString(project.appStoreUrl!),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _platformBadge(String platform) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
      ),
      child: Text(
        platform,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}
