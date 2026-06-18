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
}

const kProjects = [
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
    techTags: ['Flutter', 'Dart', 'GraphQL', 'Firebase', 'RxDart', 'Rive'],
    platforms: ['iOS', 'Android', 'Wear OS', 'Web'],
    websiteUrl: 'https://pokeappdex.co.uk/',
    playStoreUrl: 'https://play.google.com/store/apps/details?id=com.sealstudios.pokeapp.prod',
  ),
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
    primaryColor: Color(0xff1a237e),
    techTags: ['Flutter', 'Dart', 'Firebase', 'RevenueCat', 'go_router', 'get_it'],
    platforms: ['iOS', 'Android', 'Web'],
    websiteUrl: 'https://www.pitch-in.co.uk/',
    playStoreUrl: 'https://play.google.com/store/apps/details?id=com.sealable.pitch_in',
    appStoreUrl: 'https://apps.apple.com/gb/app/pitchin-football-team-hub/id6769832882',
  ),
];
