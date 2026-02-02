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
    title: 'Internship Manager',
    description:
        'Mobile platform to find and manage internships with student profiles and company dashboards.',
    tech: ['Flutter', 'FastAPI', 'SQLite'],
    imageUrl: 'https://picsum.photos/600/300?random=1',
    githubUrl: 'https://github.com/yourname/internship-manager',
    liveDemoUrl: 'https://your-demo-link.example.com',
  ),
  Project(
    title: 'Notes App',
    description:
        'A lightweight notes app with categories, search and local persistence.',
    tech: ['Flutter', 'Provider', 'Hive'],
    imageUrl: 'https://picsum.photos/600/300?random=2',
    githubUrl: 'https://github.com/yourname/notes-app',
    liveDemoUrl: 'https://your-demo-link.example.com',
  ),
  Project(
    title: 'Event Booking',
    description:
        'App for browsing and booking local events with integrated payments.',
    tech: ['Flutter', 'Stripe', 'Node.js'],
    imageUrl: 'https://picsum.photos/600/300?random=3',
    githubUrl: 'https://github.com/yourname/event-booking',
    liveDemoUrl: 'https://your-demo-link.example.com',
  ),
];