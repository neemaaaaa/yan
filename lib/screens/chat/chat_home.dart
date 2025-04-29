import 'package:flutter/material.dart';

// La page principale avec la liste des messages
class MessagesPage extends StatelessWidget {
  final Color primaryColor = Color(0xFF4B145B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 10),
                Image.asset(
                  'assets/images/profil3.png',
                  height: 50,
                ),
                SizedBox(height: 10),
                Text(
                  'Messages',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
                Divider(color: Colors.grey[300]),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.only(bottom: 80),
                    children: [
                      messageTile(
                        context: context,
                        avatar: 'assets/images/profil2.png',
                        name: 'John Doe',
                        message: 'Roger that sir, thankyou',
                        time: '2m ago',
                        status: 'Read',
                        read: true,
                      ),
                      messageTile(
                        context: context,
                        avatar: 'assets/images/profil5.png',
                        name: 'Jack Williams',
                        message: 'Thanks for reaching us.',
                        time: '10m ago',
                        status: 'Pending',
                        read: false,
                      ),
                      messageTile(
                        context: context,
                        avatar: 'assets/images/profil4.png',
                        name: 'Computer Dev',
                        message: 'Hello World!',
                        time: '58s ago',
                        status: 'Read',
                        read: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.add, color: Colors.white),
                  label: Text('New Chat', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: StadiumBorder(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget messageTile({
    required BuildContext context,
    required String avatar,
    required String name,
    required String message,
    required String time,
    required String status,
    required bool read,
  }) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(userName: name, userAvatar: avatar),
          ),
        );
      },
      leading: Stack(
        children: [
          CircleAvatar(backgroundImage: AssetImage(avatar), radius: 24),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(backgroundColor: Colors.green, radius: 5),
          ),
        ],
      ),
      title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(message),
          SizedBox(height: 2),
          Text(time, style: TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            status,
            style: TextStyle(
              fontSize: 12,
              color: read ? Colors.purple : Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (read) Icon(Icons.check, size: 16, color: Colors.purple),
        ],
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }
}

// Nouvelle page de chat
class ChatPage extends StatelessWidget {
  final String userName;
  final String userAvatar;

  ChatPage({required this.userName, required this.userAvatar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage(userAvatar), radius: 16),
            SizedBox(width: 10),
            Text(userName),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text("Do you have a time for interviews today?"),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color(0xFF4B145B),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text("Yes, I have.", style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text("Okay, please meet me at Franklin Avenue at 5 pm"),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color(0xFF4B145B),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text("Roger that sir, thankyou", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.grey[100],
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type message...",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: Color(0xFF4B145B),
                  child: Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
