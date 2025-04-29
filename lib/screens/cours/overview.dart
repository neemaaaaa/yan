import 'package:flutter/material.dart';

class CourseDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(''),
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/machine_learning.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                  SizedBox(height: 16),
                  TabBar(
                    labelColor: Color(0xFF4B145B),
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Color(0xFF4B145B),
                    tabs: [
                      Tab(text: 'Overview'),
                      Tab(text: 'Lectures'),
                      Tab(text: 'Similar Courses'),
                    ],
                  ),
                  Container(
                    height: 400,
                    child: TabBarView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Icon(Icons.schedule, color: Color(0xFF4B145B)),
                                      SizedBox(height: 4),
                                      Text('6 Hours'),
                                    ],
                                  ),
                                  SizedBox(height: 24),
                                  Column(
                                    children: [
                                      Icon(Icons.card_membership, color: Color(0xFF4B145B)),
                                      SizedBox(height: 4),
                                      Text('Certificate'),
                                    ],
                                  ),
                                  SizedBox(height: 24),
                                  Column(
                                    children: [
                                      Icon(Icons.bar_chart, color: Color(0xFF4B145B)),
                                      SizedBox(height: 4),
                                      Text('Beginner'),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 24),
                              Text(
                                'What will I learn?',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'You will learn Machine Learning foundations, concepts and algorithms. This course gives you a solid base for AI development.',
                                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                              ),
                              SizedBox(height: 24),
                              Text(
                                'Ratings and Reviews',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Icons.star, color: Colors.amber, size: 24),
                                  SizedBox(width: 8),
                                  Text('3.4 (3 Reviews)'),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text('Lectures content here'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text('Similar courses content here'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4B145B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child: Text('Start Learning', style: TextStyle(fontSize: 18)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
