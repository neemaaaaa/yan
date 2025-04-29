import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(''),
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black,
        ),
        body: Column(
          children: [
            Container(
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/machine_learning.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Machine Learning',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      SizedBox(width: 4),
                      Text('4.6'),
                      SizedBox(width: 8),
                      Text('10.5k Learners'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const TabBar(
              labelColor: Colors.deepPurple,
              unselectedLabelColor: Colors.black,
              indicatorColor: Colors.deepPurple,
              tabs: [
                Tab(text: 'Overview'),
                Tab(text: 'Lectures'),
                Tab(text: 'Similar Courses'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // --- OVERVIEW ---
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView(
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.schedule, color: Color(0xFF4B145B)),
                                SizedBox(width: 8),
                                Text('6 Hours'),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.card_membership, color: Color(0xFF4B145B)),
                                SizedBox(width: 8),
                                Text('Certificate'),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.bar_chart, color: Color(0xFF4B145B)),
                                SizedBox(width: 8),
                                Text('Beginner'),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'What will I learn?',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'You will learn Machine Learning foundations, concepts and algorithms. This course gives you a solid base for AI development.',
                          style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Ratings and Reviews',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        const Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 24),
                            SizedBox(width: 8),
                            Text('3.4 (3 Reviews)'),
                          ],
                        ),
                        const SizedBox(height: 32),

                        /// --- BOUTON YOUTUBE ---
                        Center(
                          child: ElevatedButton(
                            onPressed: () async {
                              const url = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ';
                              final uri = Uri.parse(url);
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(uri, mode: LaunchMode.externalApplication);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Impossible d\'ouvrir la vidéo')),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Start Learning',
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // --- LECTURES ---
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: [
                        buildLessonTile('Lesson 1', '\nIntroduction', []),
                        buildLessonTile('Lesson 2', '\nData Preprocessing', [
                          'Sub lecture 1',
                          'Sub lecture 2',
                          'Sub lecture 3',
                          'Sub lecture 4',
                        ]),
                        buildLessonTile('Lesson 3', '\nText Mining', []),
                        buildLessonTile('Lesson 4', '\nPractice Projects', []),
                      ],
                    ),
                  ),

                  // --- SIMILAR COURSES ---
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: ListView(
                      children: const [
                        SimilarCourseItem(
                          title: 'Machine Learning',
                          rating: 4.5,
                          learners: '10.5k learners',
                          imagePath: 'assets/images/c1.png',
                        ),
                        SimilarCourseItem(
                          title: 'Getting Started with ML',
                          rating: 4.5,
                          learners: '8.2k learners',
                          imagePath: 'assets/images/machine_learning.png',
                        ),
                        SimilarCourseItem(
                          title: 'Introduction to Machine Learning',
                          rating: 4.7,
                          learners: '9.1k learners',
                          imagePath: 'assets/images/c3.png',
                        ),
                        SimilarCourseItem(
                          title: 'PG in Machine Learning',
                          rating: 4.6,
                          learners: '12.3k learners',
                          imagePath: 'assets/images/c4.png',
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

  Widget buildLessonTile(String lessonNumber, String title, List<String> subLectures) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$lessonNumber: $title',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          if (subLectures.isNotEmpty) ...[
            const Divider(),
            ...subLectures.map((sub) => Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  const Icon(Icons.play_circle),
                  const SizedBox(width: 8),
                  Text(sub),
                ],
              ),
            )),
          ]
        ],
      ),
    );
  }
}

class SimilarCourseItem extends StatelessWidget {
  final String title;
  final double rating;
  final String learners;
  final String imagePath;

  const SimilarCourseItem({
    super.key,
    required this.title,
    required this.rating,
    required this.learners,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber[700], size: 16),
                      const SizedBox(width: 4),
                      Text(rating.toString(),
                          style: const TextStyle(fontSize: 14)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(learners,
                      style:
                      const TextStyle(fontSize: 14, color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(width: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
