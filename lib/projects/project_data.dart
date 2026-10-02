import 'package:flutter/material.dart';

class ProjectInfo {
  const ProjectInfo({
    required this.name,
    required this.tagline,
    required this.description,
    required this.fullDescription,
    required this.imagePath,
    required this.primaryColor,
    required this.techTags,
    required this.platforms,
    this.websiteUrl,
    this.playStoreUrl,
    this.appStoreUrl,
    this.company,
  });

  final String name;
  final String tagline;
  final String description;
  final String fullDescription;
  final String imagePath;
  final Color primaryColor;
  final List<String> techTags;
  final List<String> platforms;
  final String? websiteUrl;
  final String? playStoreUrl;
  final String? appStoreUrl;

  /// Employer this was built for. Null for personal/independent projects —
  /// set only for professional work, where it's shown as a "Built at X" badge.
  final String? company;
}

const kPersonalProjects = [
  ProjectInfo(
    name: 'Pitch-In',
    tagline: 'Team sports management',
    description:
        'A cross-platform sports team management app built from the ground up as co-founder and lead engineer. '
        'Features role-based access for coaches, players and parents, a tactical formations canvas with freehand drawing, '
        'event coordination, in-app purchases via RevenueCat, and a fully automated CI/CD pipeline.',
    fullDescription:
        'Pitch-In is a cross-platform sports team management app built from the ground up as co-founder and lead engineer, '
        'predating widespread AI tooling.\n\n'
        'Architecture: Modular monorepo using a base feature pattern — each feature is an isolated Dart package with its '
        'own models, repositories, ViewModels, and UI, consumed by the shell app. The reactive data layer uses RxDart '
        'BehaviorSubjects and event buses to compose streams across feature boundaries. get_it wires dependencies across '
        'packages without tight coupling. Navigation is handled by go_router with redirect-based guards enforcing '
        'authentication, onboarding, and team membership. The invitation flow uses a redirect-scoped accept/invite pattern '
        'to safely add members across trust boundaries.\n\n'
        'Features: Google and Apple Sign-In · in-app purchases via RevenueCat (Apple & Stripe) · push notifications with '
        'deep-link navigation · paged and filterable event listings with persisted filter preferences · tactical '
        'formations canvas with freehand drawing, undo/redo, and multi-orientation position views · image upload with '
        'in-app cropping · GDPR-compliant account deletion · version/update service.\n\n'
        'CI/CD: 3-stage Codemagic pipeline with secrets management, signed builds, and automated distribution. '
        'Two flavours (dev/prod) with separate Firebase configs and icons. All app icons designed in-house.',
    imagePath: 'assets/images/pitch_in_icon.png',
    primaryColor: Color(0xff2E7D32),
    techTags: ['Flutter', 'Dart', 'Firebase', 'RevenueCat', 'go_router', 'get_it'],
    platforms: ['iOS', 'Android', 'Web'],
    websiteUrl: 'https://www.pitch-in.co.uk/',
    playStoreUrl: 'https://play.google.com/store/apps/details?id=com.sealable.pitch_in',
    appStoreUrl: 'https://apps.apple.com/gb/app/pitchin-football-team-hub/id6769832882',
  ),
  ProjectInfo(
    name: 'PokeApp',
    tagline: 'A full-featured Pokédex',
    description:
        'A cross-platform Pokédex built with GraphQL (PokeAPI Hasura), MVVM + RxDart streams, infinite scroll, '
        'evolution chains, Rive animations, dynamic colour theming via palette extraction, '
        'and in-app purchases for an ad-free premium tier.',
    fullDescription:
        'PokeApp is a full-featured, cross-platform Pokédex published on the App Store, Google Play, and the web.\n\n'
        'Architecture: MVVM with RxDart BehaviorSubject streams driving reactive UI state across all screens — list, '
        'detail, evolutions, forms, moves, and stats.\n\n'
        'Data layer: GraphQL (PokeAPI Hasura endpoint) with dynamically constructed queries supporting pagination, '
        'filtering by type/generation/damage class, and debounced real-time search via CombineLatestStream. A dual API '
        'strategy uses GraphQL for complex relational queries (evolution chains, move metadata) and REST for supplementary '
        'endpoints, both abstracted behind a repository pattern.\n\n'
        'A multi-flavour build system (flutter_flavorizr) provides dev, uat, prod, and paid flavours, each with isolated '
        'Firebase projects for Crashlytics, Auth, and Firestore. DI via get_it; models use built_value and '
        'built_collection for immutability and serialisation.\n\n'
        'Extras: Google Mobile Ads and in_app_purchase for a premium ad-free tier. Infinite scroll pagination, hero '
        'animations, Rive animations, dynamic colour theming via palette extraction, and audio playback of Pokémon cries.',
    imagePath: 'assets/images/poke_app_icon.png',
    primaryColor: Color(0xffC62828),
    techTags: ['Flutter', 'Dart', 'GraphQL', 'Firebase', 'RxDart'],
    platforms: ['iOS', 'Android', 'Wear OS', 'Web'],
    websiteUrl: 'https://pokeappdex.co.uk/',
    playStoreUrl: 'https://play.google.com/store/apps/details?id=com.sealstudios.pokeapp.prod',
  ),
  ProjectInfo(
    name: 'SimpleAAC',
    tagline: 'AAC for everyone',
    description:
        'An offline-first Augmentative and Alternative Communication app helping non-verbal individuals communicate '
        'through symbol-based word boards. Features a layered MVVM architecture, Firebase sync with local SQLite caching, '
        'TTS, and AI-suggested word follow-ups.',
    fullDescription:
        'SimpleAAC is an offline-first AAC app built for Android and the web using Flutter, Firebase, and Drift (SQLite).\n\n'
        'Architecture: Layered MVVM with get_it for dependency injection and RxDart BehaviorSubjects for reactive state. '
        'Models are defined with freezed and json_serializable for immutability and type safety.\n\n'
        'The data layer uses a Mediator pattern (SyncMediator) to aggregate two Firebase sources — shared core vocabulary '
        'and per-user overrides — into a single local Drift database. Writes are applied locally first for immediate UI '
        'feedback, then propagated to Firebase asynchronously. Core vocabulary is cached with a TTL to minimise redundant '
        'network fetches.\n\n'
        'Navigation is handled by go_router with multi-flavour support (dev, uat, prod). A ThemeController backed by '
        'SharedPreferences manages dynamic theming via flex_color_scheme. The app also integrates TTS, AI-suggested word '
        'follow-ups, and image path resolution services.\n\n'
        'CI/CD: Two GitHub Actions pipelines — one builds an Android App Bundle and deploys to Google Play\'s internal '
        'track; the other builds and deploys the web flavour to GitHub Pages.',
    imagePath: 'assets/images/simple_aac_icon.png',
    primaryColor: Color(0xff1565C0),
    techTags: ['Flutter', 'Dart', 'Firebase', 'Firestore', 'go_router', 'get_it', 'Drift'],
    platforms: ['Android', 'Web'],
    websiteUrl: 'https://simpleaac.co.uk/',
    playStoreUrl: 'https://play.google.com/store/apps/details?id=com.sealstudios.simple_aac',
  ),
];

const kProfessionalProjects = [
  ProjectInfo(
    name: 'Killik & Co App',
    tagline: 'Save, Plan, Invest',
    description:
        'The client-facing wealth management app for Killik & Co, a financial services firm. As '
        'Senior Flutter Developer I lead architectural transformation, security hardening, and '
        'release process improvements, plus a new web-based companion tool that lets the support '
        'team view the app as the customer sees it.',
    fullDescription:
        'The client-facing app for Killik & Co — clients manage ISAs, SIPPs, and general '
        'investment accounts, trade stocks, and track performance.\n\n'
        'Architectural Transformation: Led the "Clanker" structural renewal, removing 1.58M lines '
        'of legacy code and reducing project complexity by 20%.\n\n'
        'Security & Compliance: Mitigated critical privacy risks around shared-data flaws; '
        'implemented standardised secure transit (iOS) and disallowed clear-text traffic (Android) '
        'to meet financial security standards.\n\n'
        'Support Tooling: Built a read-only web "companion view" of the app for the internal '
        'support workbench, launched via a one-time impersonation JWT redirect so advisors see '
        'exactly what the customer sees, with mutating requests silently absorbed and a scoped '
        'identity token swapped in so advisor- and customer-driven activity stay distinguishable '
        'in the audit trail. This meant getting the native-first Flutter codebase building for web '
        'for the first time, replacing platform-locked dependencies with conditional web '
        'implementations and standing up the Docker/GitLab CI pipeline to deploy it.\n\n'
        'Process: Shifted delivery from a "Merge-First" to a "Feature-Validation" RC model and a '
        'new Production/UAT/Staging Git flow, reducing maintenance surface area by 22%.',
    imagePath: 'assets/images/killik_icon.png',
    primaryColor: Color(0xff0b3d2e),
    techTags: ['Flutter', 'Dart', 'Riverpod', 'Docker', 'GitLab CI'],
    platforms: ['iOS', 'Android'],
    websiteUrl: 'https://killik.com/',
    playStoreUrl: 'https://play.google.com/store/apps/details?id=com.killik.mykillik',
    company: 'Killik & Co',
  ),
  ProjectInfo(
    name: 'GemEx',
    tagline: 'Workplace experience platform',
    description:
        'A white-label workplace experience app used by large enterprises including EY, Zurich, '
        'Knight Frank, and M&G, covering desk/room/parking booking, access control, indoor '
        'positioning, and colleague finding. I worked on it across two stints at Spica '
        'Technologies — originally as Mobile Developer, then returning as Senior Mobile Developer.',
    fullDescription:
        'GemEx (originally the Spica Workplace Experience App) is a white-label app for building '
        'and facilities management, built for large enterprise clients.\n\n'
        'Features: desk, room, and parking booking via interactive floorplans; hot desking and '
        'team bookings; access control; indoor positioning and colleague finding — all highly '
        'customisable per client, from look and feel to intricate booking rules.\n\n'
        'I was responsible for development, maintenance, and deployment across two stints at '
        'Spica Technologies, the second with an expanded scope covering architecture planning and '
        'pull request reviews across the wider engineering team.',
    imagePath: 'assets/images/gemex_icon.png',
    primaryColor: Color(0xff0f7b6c),
    techTags: ['Flutter', 'Dart', 'IoT Integration'],
    platforms: ['iOS', 'Android'],
    websiteUrl: 'https://www.spicatech.co.uk/products/book/',
    playStoreUrl:
        'https://play.google.com/store/apps/details?id=uk.co.spicatech.luna.apps.spicaluna',
    company: 'Spica Technologies',
  ),
  ProjectInfo(
    name: 'Wordskii',
    tagline: 'Linguist booking & on-demand video interpreting',
    description:
        'Built from scratch as Lead Mobile Developer for Word360, an interpreting and translation '
        'company. Wordskii lets linguists manage bookings, calendars, and sign off completed work; '
        'Wordskii Live and the Wordskii on Wheels (WOW) trolleys give healthcare staff on-demand '
        'video interpreting, including BSL, at the point of care.',
    fullDescription:
        'Wordskii is Word360\'s linguist booking platform, built from nothing for Android and iOS '
        'using Flutter, including store management, delivery, and analytics.\n\n'
        'The main app lets linguists manage bookings and calendars, sign off and submit completed '
        'work, with biometric authentication, offline signing, document uploading, and Google Maps '
        'integration.\n\n'
        'I also built and delivered Wordskii Live, the on-demand video interpreting platform, '
        'along with the Wordskii on Wheels (WOW) trolleys that run it — portable units deployed in '
        'hospitals (including NHS maternity wards) giving clinical staff instant access to '
        'interpreters at the patient\'s bedside. The trolley app is a thin native wrapper that '
        'boots straight into the core web app, so most of the engineering effort went into making '
        'that handoff and the on-device experience solid on fixed hospital hardware.',
    imagePath: 'assets/images/wordskii_icon.png',
    primaryColor: Color(0xff2e9cca),
    techTags: ['Flutter', 'Dart', 'Firebase', 'Google Maps'],
    platforms: ['iOS', 'Android'],
    websiteUrl: 'https://www.word360.co.uk/our-technology/wordskii-wows',
    playStoreUrl: 'https://play.google.com/store/apps/details?id=com.wordskii.prod',
    company: 'Word360',
  ),
];

const kProjects = [...kPersonalProjects, ...kProfessionalProjects];
