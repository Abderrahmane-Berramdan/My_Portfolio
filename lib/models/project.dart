class Project {
  final String title;
  final String description;
  final List<String> tech;
  final String imageUrl;
  final String githubUrl;
  final String liveDemoUrl;

  Project({
    required this.title,
    required this.description,
    required this.tech,
    required this.imageUrl,
    required this.githubUrl,
    required this.liveDemoUrl,
  });
}

final List<Project> sampleProjects = [
  Project(
    title: 'Books Online — Freelance Project',
    description:
        'A responsive Arabic mathematics e-library developed for a real client, featuring public book browsing and a protected admin panel for managing subjects, books, and digital files.',
    tech: [
      'Flutter',
      'Dart',
      'Firebase Authentication',
      'Firebase Firestore',
      'Firebase Custom Claims',
      'Supabase Storage',
      'Google Drive API',
      'Provider',
      'MVVM',
      'Responsive Design',
      'Netlify',
    ],
    imageUrl: 'assets/projects/books_online3.png',
    githubUrl: 'empty',
    liveDemoUrl: 'https://books-online-library.netlify.app',
  ),
  Project(
    title: 'Stagini',
    description:
        'An internship management platform built to help students explore opportunities, track applications, and interact with company offers in a modern Flutter interface.',
    tech: [
      'Flutter',
      'FastAPI',
      'REST API',
      'SharedPreferences',
      'Provider',
      'MVVM',
      'flutter_secure_storage',
      'Deep Links',
      'flutter_map',
      'QR Code Scanning',
    ],
    imageUrl: 'assets/projects/stagini.png',
    githubUrl: 'empty',
    liveDemoUrl: 'empty',
  ),
  Project(
    title: 'Netflix clone',
    description:
        'Netflix Clone - A Flutter app powered by TMDB API, featuring a Netflix-style UI with animated splash screen, movie & TV listings (Popular, Trending, Top Rated).',
    tech: [
      'Flutter',
      'REST API',
      'Provider',
      'cached_network_image',
      'TMDB API',
    ],
    imageUrl: 'assets/projects/netflix.png',
    githubUrl: 'https://github.com/Abderrahmane-Berramdan/netflix_clone',
    liveDemoUrl: 'https://youtube.com/shorts/XgMcv0nVNnY',
  ),
  Project(
    title: 'Portfolio Website',
    description:
        'A responsive personal portfolio website built to showcase my projects, skills, experience, and contact information with a clean modern UI.',
    tech: [
      'Flutter',
      'Dart',
      'animate_do',
      'visibility_detector',
      'lottie',
      'url_launcher',
    ],
    imageUrl: 'assets/projects/my_portfolio.png',
    githubUrl: 'https://github.com/Abderrahmane-Berramdan/My_Portfolio',
    liveDemoUrl: 'empty',
  ),
];
