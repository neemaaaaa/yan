import 'package:flutter/material.dart';
import 'package:yan/screens/cours/overview.dart';


class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: !_isSearching
            ? Text('My Courses')
            : TextField(
          controller: _searchController,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) {
                  _searchController.clear();
                }
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  CourseCard(
                    title: 'Machine Learning',
                    description:
                    'The Machine learning basics program is designed to offer a solid foundation & work-ready skills for ML engineers...',
                    hoursLeft: 4,
                    progress: 40,
                  ),
                  CourseCard(
                    title: 'Data Science',
                    description:
                    'Most people know the power Excel can wield, especially when used properly. But fewer people know how to make...',
                    hoursLeft: 2,
                    progress: 60,
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

class CourseCard extends StatelessWidget {
  final String title;
  final String description;
  final int hoursLeft;
  final int progress;

  CourseCard({
    required this.title,
    required this.description,
    required this.hoursLeft,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(description),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.access_time),
                    SizedBox(width: 4),
                    Text('$hoursLeft hours left'),
                  ],
                ),
                Row(
                  children: [
                    CircularProgressIndicator(
                      value: progress / 100,
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                    SizedBox(width: 8),
                    Text('$progress%'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  CourseDetailPage()),
                );},
                child: Text('Start Learning'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
