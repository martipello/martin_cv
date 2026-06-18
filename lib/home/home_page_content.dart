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
  });
  final String company;
  final String role;
  final String period;
  final String summary;
  final String fullDetails;
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
        'and a 60% reduction in agent support time for client access issues.',
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
        'requests, and generally supporting the team.',
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
        'The main app allows linguists to manage bookings, calendars, sign off and submit '
        'completed work. It features biometric authentication, offline signing, document '
        'uploading, and Google Maps integration.\n\n'
        'I also built and delivered Wordskii Live — a video application allowing people to '
        'instantly connect with interpreters on demand.',
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
        'Their Workplace Experience App is a white-label application providing contextual '
        'and location-aware services including meeting room booking, access control, indoor '
        'positioning, and colleague finding.\n\n'
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
        Text(
          'Hi, I\'m Martin',
          style: context.text.headlineMedium,
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
          'I keep up with industry trends and new technologies and have built '
          'projects with many technologies to solve various problems in varying sectors.',
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
          FilledButton.icon(
            icon: const Icon(Icons.code_rounded, size: 18),
            label: const Text('GitHub'),
            onPressed: () => launchUrlString('https://github.com/martipello'),
          ),
          OutlinedButton.icon(
            icon: const Icon(Icons.email_outlined, size: 18),
            label: const Text('Email'),
            onPressed: () => launchUrlString('mailto:martinseal1987@gmail.com'),
          ),
          OutlinedButton.icon(
            icon: const Icon(Icons.extension_outlined, size: 18),
            label: const Text('pub.dev'),
            onPressed: () =>
                launchUrlString('https://pub.dev/publishers/sealstudios.co.uk/packages'),
          ),
          OutlinedButton.icon(
            icon: const Icon(Icons.privacy_tip_outlined, size: 18),
            label: const Text('Privacy Policy'),
            onPressed: () =>
                launchUrlString('https://www.sealstudios.co.uk/#/privacy_policy'),
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
            style: context.text.titleLarge?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(width: 16),
          const Expanded(child: Divider(thickness: 1)),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Skills
// ---------------------------------------------------------------------------

class _SkillsSection extends StatelessWidget {
  const _SkillsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ..._mainSkills.map((s) => _SkillRow(skill: s)),
        kMediumMargin,
        Text(
          'Also experienced with:',
          style: context.text.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.55),
          ),
        ),
        kSmallMargin,
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _otherSkills
              .map(
                (s) => Chip(
                  label: Text(s, style: const TextStyle(fontSize: 12)),
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
  const _SkillRow({required this.skill});
  final _Skill skill;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final outline = Theme.of(context).colorScheme.outline;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(
            width: 88,
            child: Text(
              skill.name,
              style: context.text.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Row(
            children: List.generate(5, (i) {
              return Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Icon(
                  i < skill.level ? Icons.circle : Icons.circle_outlined,
                  size: 10,
                  color: i < skill.level ? primary : outline.withValues(alpha: 0.35),
                ),
              );
            }),
          ),
          const SizedBox(width: 12),
          Text(
            skill.label,
            style: context.text.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.55),
            ),
          ),
        ],
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

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final onSurface = Theme.of(context).colorScheme.onSurface;

    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Left accent bar
            Container(
              width: 3,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
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
                ],
              ),
            ),
          ],
        ),
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
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.55),
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
                style: context.text.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
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
