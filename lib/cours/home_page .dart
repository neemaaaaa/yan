import 'package:flutter/material.dart';
import 'package:yan/cours/cour1.dart';

class MainNavigationPage extends StatefulWidget {
  @override
  _MainNavigationPageState createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _currentIndex = 3;

  final List<Widget> _pages = [
    PlaceholderWidget(icon: Icons.home, title: 'Home'),
    PlaceholderWidget(icon: Icons.search, title: 'Search'),
    PlaceholderWidget(icon: Icons.chat, title: 'Chat'),
    MyCoursesPage(),
    PlaceholderWidget(icon: Icons.more_vert, title: 'More'),
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
        selectedItemColor: Color(0xFF4B145B), // Couleur violette pour l'item actif
        unselectedItemColor: Colors.grey,     // Couleur grise pour les autres
        backgroundColor: Colors.white,         // Fond blanc
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

  const PlaceholderWidget({required this.icon, required this.title, Key? key}) : super(key: key);

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
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
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
