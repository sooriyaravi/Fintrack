import 'package:finapp/bankloan.dart';
import 'package:finapp/chat.dart';
import 'package:finapp/loanterm.dart';
import 'package:finapp/profile.dart';
import 'package:flutter/material.dart';

class LoanListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        
        title: Text(
          'LOANS AVAILABLE',
          style: TextStyle(color: Color(0xFF21471E), fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Color(0xFF21471E)),
            onPressed: () {
              Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BankLoansScreen()),
                          );
            },
          ),
        ],
      ),
drawer: _buildDrawer(context), // Calling the drawer function
      body: ListView.separated(
        padding: EdgeInsets.all(10),
        itemCount: 5,
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              leading: Icon(Icons.account_balance, size: 35, color: Color(0xFF21471E)),
              title: Text(
                'INDIAN BANK',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Color(0xFF21471E)), 
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Rs.100000 with 2% interest', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)), 
                  Text('2 years', style: TextStyle(color: Color(0xFF21471E), fontSize: 14, fontWeight: FontWeight.w400)), 
                ],
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFF21471E)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatScreen()),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

 /// **Drawer Function**
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Drawer Header
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF21471E), // Theme Color
            ),
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

          // Drawer Items
_buildDrawerItem(Icons.person, "Profile", () {
             Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilePage()),
          );
          }),          _buildDrawerItem(Icons.settings, "Settings", () {}),
          _buildDrawerItem(Icons.info, "About", () {}),
          _buildDrawerItem(Icons.help, "Help & Support", () {}),
          Divider(), // Line Separator
          _buildDrawerItem(Icons.logout, "Logout", () {}),
        ],
      ),
    );
  }

  /// **Reusable Drawer Item**
  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF21471E)),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black87)),
      onTap: onTap,
    );
  }
