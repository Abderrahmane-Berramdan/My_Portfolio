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
    githubUrl: 'https://github.com/yourname/internship-manager',
    liveDemoUrl: 'https://your-demo-link.example.com',
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
    liveDemoUrl: 'https://your-demo-link.example.com',
  ),
];
