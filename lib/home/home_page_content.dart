import 'package:flutter/material.dart';
import 'package:martin_cv/extensions/context_extensions.dart';
import 'package:martin_cv/margins.dart';
import 'package:martin_cv/widgets/view_constraint.dart';
import 'package:url_launcher/url_launcher_string.dart';

// ---------------------------------------------------------------------------
// Data
// ---------------------------------------------------------------------------

class _Skill {
  const _Skill(this.name, this.level, this.label);
  final String name;
  final int level; // 1–5
  final String label;
}

class _Job {
  const _Job({
    required this.company,
    required this.role,
    required this.period,
    required this.summary,
    required this.fullDetails,
    this.appName,
    this.appTagline,
    this.appIconPath,
    this.playStoreUrl,
    this.appWebsiteUrl,
  });
  final String company;
  final String role;
  final String period;
  final String summary;
  final String fullDetails;
  final String? appName;
  final String? appTagline;
  final String? appIconPath;
  final String? playStoreUrl;
  final String? appWebsiteUrl;
}

const _mainSkills = [
  _Skill('Flutter', 5, 'Expert'),
  _Skill('Dart', 5, 'Expert'),
  _Skill('Android', 4, 'Intermediate'),
  _Skill('Kotlin', 4, 'Intermediate'),
  _Skill('Java', 4, 'Intermediate'),
  _Skill('Git', 4, 'Intermediate'),
  _Skill('Swift', 3, 'Good'),
  _Skill('Xcode', 4, 'Intermediate'),
];

const _otherSkills = [
  'Firebase',
  'CI/CD',
  'MySQL',
  'SQLite',
  'JavaScript',
  'HTML',
  'CSS',
  'C#',
  'Unity',
  'GraphQL',
];

const _jobs = [
  _Job(
    company: 'Killik & Co',
    role: 'Senior Flutter Developer',
    period: 'Jan 2025 – Present',
    summary:
        'Led architectural transformation and security improvements for a financial services '
        'Flutter platform, reducing technical debt and improving operational reliability.',
    fullDetails:
        'Architectural Transformation: Led the "Clanker" structural renewal, reducing technical '
        'debt by removing 1.58M lines of legacy code and reducing project complexity by 20%.\n\n'
        'Security & Compliance: Mitigated critical privacy risks around shared-data flaws; '
        'implemented standardised secure transit (iOS) and disallowed clear-text traffic (Android) '
        'to meet financial security standards.\n\n'
        'Operational Excellence: Shifted delivery from a "Merge-First" to a "Feature-Validation" '
        'RC model, reducing maintenance surface area by 22% and eliminating release pollution.\n\n'
        'Strategy & Leadership: Authored the company\'s "Source of Truth" engineering documentation '
        'and implemented a new Git flow (Production/UAT/Staging) for predictable release cycles.\n\n'
        'Data Recovery: Restored a 6-month Firebase Analytics blackout, re-establishing 100% '
        'visibility into user behaviour and feature ROI for executive decision-making.\n\n'
        'Performance: Delivered an authentication refactor resulting in 23% fewer login queries '
        'and a 60% reduction in agent support time for client access issues.\n\n'
        'Support Tooling: Built a read-only web "companion view" of the app for the internal '
        'support workbench, launched via a one-time impersonation JWT redirect so advisors see '
        'exactly what the customer sees, with mutating requests silently absorbed and a scoped '
        'identity token swapped in so advisor- and customer-driven activity stay distinguishable '
        'in the audit trail. Also got the native-first Flutter codebase building for web for the '
        'first time, replacing platform-locked dependencies with conditional web implementations '
        'and standing up the Docker/GitLab CI pipeline to deploy it.',
    appName: 'Killik & Co: Save, Plan, Invest',
    appTagline: 'The client wealth management app I work on day-to-day',
    appIconPath: 'assets/images/killik_icon.png',
    playStoreUrl:
        'https://play.google.com/store/apps/details?id=com.killik.mykillik',
    appWebsiteUrl: 'https://killik.com/',
  ),
  _Job(
    company: 'Spica Technologies',
    role: 'Senior Mobile Developer',
    period: 'Apr 2022 – Jan 2025',
    summary:
        'Returned with expanded responsibilities covering architecture planning, engineering '
        'tribe contributions, complex time-zone and digital-access problem-solving, and PR reviews.',
    fullDetails:
        'After spending time at Word360 I moved back to Spica Technologies with a changed scope '
        'that included more planning and architectural decisions, contributing to engineer tribe '
        'meetings, solving complex issues with time zones and digital access, reviewing pull '
        'requests, and generally supporting the team — on the same Workplace Experience App '
        '(since rebranded GemEx) described below.',
    appName: 'GemEx (formerly Spica Workplace App)',
    appTagline:
        'White-label workplace booking app for enterprise facilities management',
    appIconPath: 'assets/images/gemex_icon.png',
    playStoreUrl:
        'https://play.google.com/store/apps/details?id=uk.co.spicatech.luna.apps.spicaluna',
    appWebsiteUrl: 'https://www.spicatech.co.uk/products/book/',
  ),
  _Job(
    company: 'Word360',
    role: 'Lead Mobile Developer',
    period: 'Apr 2021 – Apr 2022',
    summary:
        'Built mobile applications from scratch for an interpreting and translation company '
        'using Flutter for iOS and Android, including a live video interpretation platform.',
    fullDetails:
        'Word360 is an interpreting and translation company. I built their mobile applications '
        'from nothing for both Android and iOS using Flutter, managing stores, delivery, and '
        'analytics throughout.\n\n'
        'The main app (Wordskii) allows linguists to manage bookings, calendars, sign off and '
        'submit completed work. It features biometric authentication, offline signing, document '
        'uploading, and Google Maps integration.\n\n'
        'I also built and delivered Wordskii Live, the on-demand video interpreting platform, '
        'along with the Wordskii on Wheels (WOW) trolleys that run it — portable units deployed '
        'in hospitals (including NHS maternity wards) giving clinical staff instant access to '
        'interpreters, including BSL, at the patient\'s bedside. The trolley app is a thin native '
        'wrapper that boots straight into the core web app, so most of the real engineering work '
        'was making that handoff and the on-device experience solid on fixed hospital hardware.',
    appName: 'Wordskii',
    appTagline:
        'Linguist booking platform behind Word360\'s interpreting services',
    appIconPath: 'assets/images/wordskii_icon.png',
    playStoreUrl:
        'https://play.google.com/store/apps/details?id=com.wordskii.prod',
  ),
  _Job(
    company: 'Spica Technologies',
    role: 'Mobile Developer',
    period: 'Oct 2018 – Apr 2021',
    summary:
        'Developed and maintained a white-label workplace experience IoT app used by major '
        'enterprises including EY, Zurich, Knight Frank, and M&G.',
    fullDetails:
        'Spica Tech is an IoT company specialising in building and facilities management. '
        'Their Workplace Experience App (since rebranded GemEx) is a white-label application '
        'providing contextual and location-aware services including desk, room, and parking '
        'booking via interactive floorplans, access control, indoor positioning, and colleague '
        'finding.\n\n'
        'I was responsible for the development, maintenance, and deployment of their '
        'applications. The app is highly customisable — from look and feel to intricate '
        'rules — for large enterprises such as EY, Zurich, Knight Frank, and M&G.',
  ),
];

// ---------------------------------------------------------------------------
// Main content widget
// ---------------------------------------------------------------------------

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ViewConstraint(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            kMediumMargin,
            _buildIntro(context),
            const _SectionDivider(label: 'Skills'),
            const _SkillsSection(),
            const _SectionDivider(label: 'Employment History'),
            _buildEmploymentIntro(context),
            const _EmploymentSection(),
            const _SectionDivider(label: 'Experience'),
            _buildExperience(context),
            const _SectionDivider(label: 'Education'),
            const _EducationSection(),
            const _SectionDivider(label: 'Links'),
            _buildLinks(context),
            kXLargeMargin,
          ],
        ),
      ),
    );
  }

  Widget _buildIntro(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Hi, I\'m Martin',
              style: context.text.headlineMedium,
            ),
            const SizedBox(width: 10),
            const _WavingHand(),
          ],
        ),
        kSmallMargin,
        Text(
          'Senior Mobile Developer · Flutter Specialist',
          style: context.text.titleMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        kMediumMargin,
        Text(
          'I\'m a keen problem solver with a love for coding, learning and family. '
          'I keep up with industry trends and new technologies, and I\'ve got a bit of '
          'a habit of building things just to see if I can.',
          style: context.text.bodyLarge?.copyWith(height: 1.6),
        ),
        kSmallMargin,
        Text(
          'Head over to the Projects tab to see what I\'ve been shipping.',
          style: context.text.bodyLarge?.copyWith(height: 1.6),
        ),
      ],
    );
  }

  Widget _buildEmploymentIntro(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        'Where I\'ve been earning my stripes (and my coffee).',
        style: context.text.bodyLarge?.copyWith(
          height: 1.6,
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
        ),
      ),
    );
  }

  Widget _buildExperience(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        'I\'ve created multiple apps available on the Google Play Store and the web, '
        'open source packages on pub.dev, and I build animations with Rive, Flutter, '
        'and CAD tools. I have 7+ years of experience with Flutter, reactive programming '
        'and CI/CD, and 10+ years in Android development.\n\n'
        'Pub.dev packages: Hive Built Value  ·  Local Hero  ·  Haptic Rotary Scroll',
        style: context.text.bodyLarge?.copyWith(height: 1.7),
      ),
    );
  }

  Widget _buildLinks(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          _HoverScale(
            child: FilledButton.icon(
              icon: const Icon(Icons.code_rounded, size: 18),
              label: const Text('GitHub'),
              onPressed: () => launchUrlString('https://github.com/martipello'),
            ),
          ),
          _HoverScale(
            child: OutlinedButton.icon(
              icon: const Icon(Icons.email_outlined, size: 18),
              label: const Text('Email'),
              onPressed: () =>
                  launchUrlString('mailto:martinseal1987@gmail.com'),
            ),
          ),
          _HoverScale(
            child: OutlinedButton.icon(
              icon: const Icon(Icons.extension_outlined, size: 18),
              label: const Text('pub.dev'),
              onPressed: () => launchUrlString(
                  'https://pub.dev/publishers/sealstudios.co.uk/packages'),
            ),
          ),
          _HoverScale(
            child: OutlinedButton.icon(
              icon: const Icon(Icons.privacy_tip_outlined, size: 18),
              label: const Text('Privacy Policy'),
              onPressed: () => launchUrlString(
                  'https://www.sealstudios.co.uk/#/privacy_policy'),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Section divider
// ---------------------------------------------------------------------------

class _SectionDivider extends StatelessWidget {
  const _SectionDivider({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28),
      child: Row(
        children: [
          Text(
            label,
            style:
                context.text.titleLarge?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(width: 16),
          const Expanded(child: Divider(thickness: 1)),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Waving hand (plays a couple of waves on load, then pauses and repeats)
// ---------------------------------------------------------------------------

class _WavingHand extends StatefulWidget {
  const _WavingHand();

  @override
  State<_WavingHand> createState() => _WavingHandState();
}

class _WavingHandState extends State<_WavingHand>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    _loop();
  }

  Future<void> _loop() async {
    while (mounted) {
      for (var i = 0; i < 3; i++) {
        if (!mounted) return;
        await _controller.forward(from: 0);
        if (!mounted) return;
        await _controller.reverse();
      }
      if (!mounted) return;
      await Future.delayed(const Duration(seconds: 4));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 0.5,
          alignment: Alignment.bottomCenter,
          child: child,
        );
      },
      child: const Text('👋', style: TextStyle(fontSize: 26)),
    );
  }
}

// ---------------------------------------------------------------------------
// Hover scale (no-op on touch; gentle pop on desktop hover)
// ---------------------------------------------------------------------------

class _HoverScale extends StatefulWidget {
  const _HoverScale({required this.child});
  final Widget child;

  @override
  State<_HoverScale> createState() => _HoverScaleState();
}

class _HoverScaleState extends State<_HoverScale> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedScale(
        scale: _hovering ? 1.06 : 1.0,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
        child: widget.child,
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Skills
// ---------------------------------------------------------------------------

class _SkillsSection extends StatefulWidget {
  const _SkillsSection();

  @override
  State<_SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<_SkillsSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500 + _mainSkills.length * 90),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var i = 0; i < _mainSkills.length; i++)
          _SkillRow(
            skill: _mainSkills[i],
            animation: CurvedAnimation(
              parent: _controller,
              curve: Interval(
                i / _mainSkills.length * 0.7,
                i / _mainSkills.length * 0.7 + 0.3,
                curve: Curves.easeOutBack,
              ),
            ),
          ),
        kMediumMargin,
        Text(
          'Also experienced with:',
          style: context.text.bodyMedium?.copyWith(
            color:
                Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.55),
          ),
        ),
        kSmallMargin,
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _otherSkills
              .map(
                (s) => _HoverScale(
                  child: Chip(
                    label: Text(s, style: const TextStyle(fontSize: 12)),
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              )
              .toList(),
        ),
        kMediumMargin,
      ],
    );
  }
}

class _SkillRow extends StatelessWidget {
  const _SkillRow({required this.skill, required this.animation});
  final _Skill skill;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final outline = Theme.of(context).colorScheme.outline;

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        // easeOutBack overshoots past 1.0, which Opacity won't accept — clamp
        // it for fade-in while leaving the slide offset free to bounce.
        return Opacity(
          opacity: animation.value.clamp(0.0, 1.0),
          child: Transform.translate(
            offset: Offset((1 - animation.value) * -24, 0),
            child: child,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            SizedBox(
              width: 88,
              child: Text(
                skill.name,
                style: context.text.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            Row(
              children: List.generate(5, (i) {
                return Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Icon(
                    i < skill.level ? Icons.circle : Icons.circle_outlined,
                    size: 10,
                    color: i < skill.level
                        ? primary
                        : outline.withValues(alpha: 0.35),
                  ),
                );
              }),
            ),
            const SizedBox(width: 12),
            Text(
              skill.label,
              style: context.text.bodyMedium?.copyWith(
                color: Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withValues(alpha: 0.55),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Employment
// ---------------------------------------------------------------------------

class _EmploymentSection extends StatelessWidget {
  const _EmploymentSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _jobs.map((job) => _EmploymentTile(job: job)).toList(),
    );
  }
}

class _EmploymentTile extends StatefulWidget {
  const _EmploymentTile({required this.job});
  final _Job job;

  @override
  State<_EmploymentTile> createState() => _EmploymentTileState();
}

class _EmploymentTileState extends State<_EmploymentTile> {
  bool _expanded = false;
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final onSurface = Theme.of(context).colorScheme.onSurface;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(_hovering ? 4 : 0, 0, 0),
        padding: const EdgeInsets.only(bottom: 24),
        child: Container(
          padding: const EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
            border: Border(left: BorderSide(color: primary, width: 3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.job.company,
                style: context.text.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '${widget.job.role}  ·  ${widget.job.period}',
                style: context.text.bodyMedium?.copyWith(
                  color: onSurface.withValues(alpha: 0.6),
                ),
              ),
              const SizedBox(height: 10),
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                alignment: Alignment.topCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedCrossFade(
                      duration: const Duration(milliseconds: 250),
                      crossFadeState: _expanded
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      firstChild: Text(
                        widget.job.summary,
                        style: context.text.bodyLarge?.copyWith(height: 1.6),
                      ),
                      secondChild: Text(
                        widget.job.fullDetails,
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
              if (widget.job.appIconPath != null) ...[
                const SizedBox(height: 14),
                _AppBadge(job: widget.job, accentColor: primary),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// App badge (store listing attached to an employment entry)
// ---------------------------------------------------------------------------

class _AppBadge extends StatelessWidget {
  const _AppBadge({required this.job, required this.accentColor});

  final _Job job;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    final onSurface = Theme.of(context).colorScheme.onSurface;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color.alphaBlend(
          accentColor.withValues(alpha: 0.06),
          Theme.of(context).colorScheme.surface,
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: accentColor.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  job.appIconPath!,
                  width: 40,
                  height: 40,
                  cacheWidth: 80,
                  cacheHeight: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      job.appName!,
                      style: context.text.bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    if (job.appTagline != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        job.appTagline!,
                        style: context.text.bodySmall?.copyWith(
                          color: onSurface.withValues(alpha: 0.6),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          if (job.playStoreUrl != null || job.appWebsiteUrl != null) ...[
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                if (job.playStoreUrl != null)
                  OutlinedButton.icon(
                    icon: const Icon(Icons.android_rounded, size: 16),
                    label: const Text('Play Store'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: accentColor,
                      side:
                          BorderSide(color: accentColor.withValues(alpha: 0.6)),
                      visualDensity: VisualDensity.compact,
                    ),
                    onPressed: () => launchUrlString(job.playStoreUrl!),
                  ),
                if (job.appWebsiteUrl != null)
                  OutlinedButton.icon(
                    icon: const Icon(Icons.language_rounded, size: 16),
                    label: const Text('Website'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: accentColor,
                      side:
                          BorderSide(color: accentColor.withValues(alpha: 0.6)),
                      visualDensity: VisualDensity.compact,
                    ),
                    onPressed: () => launchUrlString(job.appWebsiteUrl!),
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Education
// ---------------------------------------------------------------------------

class _EducationSection extends StatelessWidget {
  const _EducationSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _EducationEntry(
          title: 'Udacity Google Challenge Scholar',
          year: '2014',
          detail:
              'Received a Google scholarship for Udacity\'s Android Basics and Advanced Developer '
              'course. Completed courses in Java, SQLite, C#, HTML and CSS, plus additional '
              'projects including a Protocol Buffers deep-dive and multiple small apps to expand '
              'programming skills.',
        ),
        kLargeMediumMargin,
        Text(
          'Certificates',
          style: context.text.titleSmall?.copyWith(
            color:
                Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.55),
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        kSmallMargin,
        ...[
          'Android Advanced NanoDegree',
          'Android Basics',
          'NCFE Interactive Media and Design',
          'NCFE IT Skills',
        ].map(
          (cert) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              children: [
                Icon(
                  Icons.verified_outlined,
                  size: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(cert, style: context.text.bodyMedium),
              ],
            ),
          ),
        ),
        kMediumMargin,
      ],
    );
  }
}

class _EducationEntry extends StatelessWidget {
  const _EducationEntry({
    required this.title,
    required this.year,
    required this.detail,
  });

  final String title;
  final String year;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.school_outlined,
          size: 20,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$title  ·  $year',
                style: context.text.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 6),
              Text(
                detail,
                style: context.text.bodyMedium?.copyWith(height: 1.6),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
