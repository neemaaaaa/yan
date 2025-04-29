import 'package:flutter/material.dart';
import 'package:yan/screens/chat/chat_home.dart';
import 'package:yan/screens/cours/cour1.dart';
import 'package:yan/screens/more/more_page.dart';

class MainNavigationPage extends StatefulWidget {
  @override
  _MainNavigationPageState createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    PlaceholderWidget(icon: Icons.search, title: 'Search'),
    MessagesPage(),
    MyCoursesPage(),
    MorePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor:
            Color(0xFF4B145B), // Couleur violette pour l'item actif
        unselectedItemColor: Colors.grey, // Couleur grise pour les autres
        backgroundColor: Colors.white, // Fond blanc
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book), // Icône pour Courses
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_vert), // Icône 3 points pour More
            label: 'More',
          ),
        ],
      ),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final IconData icon;
  final String title;

  const PlaceholderWidget({required this.icon, required this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          Text(title, style: const TextStyle(fontSize: 24, color: Colors.grey)),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Top section: App Logo and Profile
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                children: [
                  // Logo + Title (centered)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 80,
                      ),
                      const SizedBox(
                          width: 8), // spacing between logo and title
                      const Text(
                        'JobSphere',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Profile Icon (aligned to right)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/images/3.png'),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Divider(
                color: Colors.grey[300],
                thickness: 1,
              ),
            ),

            // Categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Icon(Icons.folder, color: Colors.deepPurple),
                  const SizedBox(width: 8), // space between icon and text
                  Text(
                    'Categories',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _buildCategoryCard(
                      'Cyber Security', '145 Courses', Icons.security),
                  const SizedBox(width: 10),
                  _buildCategoryCard(
                      'Data Science', '120 Courses', Icons.bar_chart),
                  const SizedBox(width: 10),
                  _buildCategoryCard(
                      'Web Development', '98 Courses', Icons.web),
                  const SizedBox(width: 10),
                  _buildCategoryCard(
                      'AI & Machine Learning', '85 Courses', Icons.memory),
                  const SizedBox(width: 10),
                  _buildCategoryCard(
                      'Graphic Design', '70 Courses', Icons.design_services),
                  const SizedBox(width: 10),
                  _buildCategoryCard('Marketing', '60 Courses', Icons.campaign),
                  const SizedBox(width: 10),
                  _buildCategoryCard(
                      'Business', '90 Courses', Icons.business_center),
                ],
              ),
            ),
            const SizedBox(height: 20),

// Divider between Categories and Posts
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Divider(
                color: Colors.grey[300],
                thickness: 1,
              ),
            ),

            const SizedBox(height: 20),

            // Posts section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Icon(Icons.post_add, color: Colors.deepPurple),
                  const SizedBox(width: 8),
                  Text(
                    'Posts',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            _buildPostCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String title, String subtitle, IconData icon) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 28, color: Colors.deepPurple),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(subtitle,
              style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildPostCard() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/4.png'),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Thomas Blake',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Python Developer — PearlsTech',
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                      Text('16h • 🌍',
                          style: TextStyle(fontSize: 11, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Hello, I am looking for a new career opportunity and would appreciate your support. '
                'Thanks in advance for any contact recommendation, advice, or...',
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Row(children: [
                    Icon(Icons.thumb_up, size: 18),
                    SizedBox(width: 4),
                    Text('77')
                  ]),
                  Row(children: [
                    Icon(Icons.comment, size: 18),
                    SizedBox(width: 4),
                    Text('52 comments')
                  ]),
                ],
              ),
              const Divider(height: 20, thickness: 1),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.thumb_up_alt_outlined),
                  Icon(Icons.comment_outlined),
                  Icon(Icons.share_outlined),
                  Icon(Icons.send_outlined),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Courses'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Action de recherche
              print('Search icon pressed');
              // Tu peux ici afficher une barre de recherche
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey[300],
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/4.png',
                      width: 300,
                      height: 300,
                    ),
                    const SizedBox(height: 24),
                    const SizedBox(height: 16),
                    Text(
                      'No Courses',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Looks like you have not enrolled for any\n course yet',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PageOne()),
                        );
                      },
                      child: const Text('Explore Courses'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF4B145B),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
