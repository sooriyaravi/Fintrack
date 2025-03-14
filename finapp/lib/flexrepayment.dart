import 'package:finapp/flexrepaychat.dart';
import 'package:finapp/profile.dart';
import 'package:flutter/material.dart';


class Flexrepayment extends StatelessWidget {
  final List<Map<String, dynamic>> debts = [
    {'bank': 'Indian Bank', 'outstanding': 10000, 'page': Flexrepaychat()},
    {'bank': 'Indian Bank', 'outstanding': 10000, 'page': PageTwo()},
    {'bank': 'Indian Bank', 'outstanding': 10000, 'page': PageThree()},
    {'bank': 'Indian Bank', 'outstanding': 10000, 'page': PageFour()},
    {'bank': 'Indian Bank', 'outstanding': 10000, 'page': PageFive()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DEBT REPAYMENTS',
          style: TextStyle(
            color: Color(0xFF21471E),
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xFF21471E)),
        actions: [IconButton(icon: Icon(Icons.person, color: Color(0xFF21471E)), onPressed: () {})],
      ),
           drawer: _buildDrawer(context),
        backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: debts.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => debts[index]['page']),
                );
              },
              child: Card(
                elevation: 3,
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'INDIAN BANK',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Color(0xFF21471E),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Original: Rs.100000 with 2% interest',
                        style: TextStyle(color: Color(0xFF21471E)),
                      ),
                      Text(
                        'Outstanding: Rs.${debts[index]['outstanding']}',
                        style: TextStyle(color: Color(0xFF21471E)),
                      ),
                      Text(
                        'Monthly Payment: Rs.1000',
                        style: TextStyle(color: Color(0xFF21471E)),
                      ),
                      Text(
                        'Due Date: 29-02-2029',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.arrow_forward_ios, size: 18, color: Color(0xFF21471E)),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Different pages
class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details Page 1', style: TextStyle(color: Color(0xFF21471E)))),
      body: Center(child: Text('Details for first debt', style: TextStyle(color: Color(0xFF21471E)))),
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details Page 2', style: TextStyle(color: Color(0xFF21471E)))),
      body: Center(child: Text('Details for second debt', style: TextStyle(color: Color(0xFF21471E)))),
    );
  }
}

class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details Page 3', style: TextStyle(color: Color(0xFF21471E)))),
      body: Center(child: Text('Details for third debt', style: TextStyle(color: Color(0xFF21471E)))),
    );
  }
}

class PageFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details Page 4', style: TextStyle(color: Color(0xFF21471E)))),
      body: Center(child: Text('Details for fourth debt', style: TextStyle(color: Color(0xFF21471E)))),
    );
  }
}

class PageFive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details Page 5', style: TextStyle(color: Color(0xFF21471E)))),
      body: Center(child: Text('Details for fifth debt', style: TextStyle(color: Color(0xFF21471E)))),
    );
  }
}

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF21471E)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Color(0xFF21471E)),
                ),
                SizedBox(height: 10),
                Text("User Name", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400)),
                Text("useremail@example.com", style: TextStyle(color: Colors.white70, fontSize: 14)),
              ],
            ),
          ),
          _buildDrawerItem(Icons.person, "Profile", () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
          }),
          _buildDrawerItem(Icons.settings, "Settings", () {}),
          _buildDrawerItem(Icons.info, "About", () {}),
          _buildDrawerItem(Icons.help, "Help & Support", () {}),
          Divider(),
          _buildDrawerItem(Icons.logout, "Logout", () {}),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF21471E)),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black87)),
      onTap: onTap,
    );
  }
