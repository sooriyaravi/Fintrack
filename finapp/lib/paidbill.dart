import 'package:finapp/bankloan.dart';
import 'package:finapp/profile.dart';
import 'package:finapp/unpaidbill.dart';
import 'package:finapp/duebill.dart';
import 'package:finapp/overview.dart';
import 'package:flutter/material.dart';

class Paidbill extends StatefulWidget {
  @override
  _BillsScreenState createState() => _BillsScreenState();
}

class _BillsScreenState extends State<Paidbill> {
  final List<String> _tabs = ["BANKS & LOANS", "OVERVIEW", "SPENT", "SAVINGS", "BILLS"];
  final List<Map<String, dynamic>> paidBills = [
    {'name': 'NETFLIX', 'amount': 'Rs.300', 'paidDate': '25-02-2025', 'icon': Icons.tv},
    {'name': 'ELECTRICITY', 'amount': 'Rs.500', 'paidDate': '01-03-2025', 'icon': Icons.flash_on},
    {'name': 'AMAZON PRIME', 'amount': 'Rs.299', 'paidDate': '08-03-2025', 'icon': Icons.shopping_cart},
    {'name': 'SPOTIFY', 'amount': 'Rs.199', 'paidDate': '15-03-2025', 'icon': Icons.music_note},
    {'name': 'INTERNET BILL', 'amount': 'Rs.700', 'paidDate': '20-03-2025', 'icon': Icons.wifi},
  ];

  String selectedFilter = "BILLS";
  String selectedTab = "PAID";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BILLS", style: TextStyle(fontWeight: FontWeight.w400)),
        centerTitle: true,
       
        actions: [Icon(Icons.person)],
      ),
          drawer: _buildDrawer(context), // Calling the drawer function

      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _tabs.map((tab) => _buildFilterButton(tab)).toList(),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: ["UNPAID", "PAID", "DUE"].map((tab) => _buildTabButton(tab)).toList(),
              ),
            ),
            SizedBox(height: 30),
            Text(selectedTab, style: TextStyle(color: Color(0xFF21471E), fontWeight: FontWeight.w400)),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: paidBills.length,
                itemBuilder: (context, index) {
                  return _buildBillCard(paidBills[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton(String title) {
    bool isSelected = selectedFilter == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = title;
        });
        if (title == "OVERVIEW") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OverviewPage()),
          );
        }
        else if (title == "BANKS & LOANS") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BankLoansScreen()),
          );
        }
      },
      child: Container(
        margin: EdgeInsets.only(right: 12),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF21471E) : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(color: isSelected ? Colors.white :Color(0xFF21471E), fontSize: 12),
        ),
      ),
    );
  }

  Widget _buildTabButton(String title) {
    bool isSelected = selectedTab == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = title;
        });
        if (title == "DUE") {
          // Navigate 
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DueBills()),
          );
        }
           else if (title == "UNPAID") {
          // Navigate to the BillScreen when "BILLS" is tapped
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Unpaidbill()),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: isSelected ? Color(0xFF21471E) : Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            title,
            style: TextStyle(color: isSelected ? Colors.white : Color(0xFF21471E), fontSize: 12),
          ),
        ),
      ),
    );
  }

  Widget _buildBillCard(Map<String, dynamic> bill) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(vertical: 6),
      child: Card(
        elevation: 2,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: Icon(Icons.check_circle, size: 20, color: Color(0xFF21471E)),
          title: Text(
            bill['name'],
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(bill['amount'], style: TextStyle(fontSize: 12)),
              Text("Paid on: ${bill['paidDate']}", style: TextStyle(color: Color(0xFF21471E), fontSize: 12)),
            ],
          ),
          trailing: Icon(Icons.chevron_right, size: 30, color: Colors.grey),
        ),
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
          }),
          _buildDrawerItem(Icons.settings, "Settings", () {}),
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
