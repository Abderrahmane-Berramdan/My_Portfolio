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
    githubUrl: 'https://github.com/yourname/portfolio',
    liveDemoUrl: 'https://your-demo-link.example.com',
  ),
  Project(
    title: 'Event Booking',
    description:
        'App for browsing and booking local events with integrated payments.',
    tech: ['Flutter', 'Stripe', 'Node.js'],
    imageUrl: 'placeholder',
    githubUrl: 'https://github.com/yourname/event-booking',
    liveDemoUrl: 'https://your-demo-link.example.com',
  ),
];
