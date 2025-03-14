import 'package:finapp/bankloan.dart';
import 'package:finapp/overview.dart';
import 'package:finapp/profile.dart';
import 'package:flutter/material.dart';
import 'package:finapp/duebill.dart';
import 'package:finapp/paidbill.dart';

class Unpaidbill extends StatefulWidget {
  @override
  _BillsScreenState createState() => _BillsScreenState();
}

class _BillsScreenState extends State<Unpaidbill> {
  final List<String> _tabs = ["BANKS & LOANS", "OVERVIEW", "SPENT", "SAVINGS", "BILLS"];

  final List<Map<String, dynamic>> unpaidBills = [
    {'name': 'NETFLIX', 'amount': 'Rs.300', 'dueDate': '28-02-2025', 'icon': Icons.tv},
    {'name': 'ELECTRICITY', 'amount': 'Rs.300', 'dueDate': '02-03-2025', 'icon': Icons.flash_on},
    {'name': 'AMAZON PRIME', 'amount': 'Rs.300', 'dueDate': '10-03-2025', 'icon': Icons.shopping_cart},
    {'name': 'NETFLIX', 'amount': 'Rs.300', 'dueDate': '18-03-2025', 'icon': Icons.tv},
    {'name': 'NETFLIX', 'amount': 'Rs.300', 'dueDate': '29-03-2025', 'icon': Icons.tv},
  ];

  String selectedFilter = "BILLS";
  String selectedTab = "UNPAID";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BILLS", style: TextStyle(fontWeight: FontWeight.w400)),
        centerTitle: true,
        actions: [Icon(Icons.person)],
      ),
      drawer: _buildDrawer(context),
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
            Text(selectedTab, style: TextStyle(color: Colors.red, fontWeight: FontWeight.w400)),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: unpaidBills.length,
                itemBuilder: (context, index) {
                  return _buildBillCard(unpaidBills[index]);
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => OverviewPage()));
        } else if (title == "BANKS & LOANS") {
          Navigator.push(context, MaterialPageRoute(builder: (context) => BankLoansScreen()));
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
          style: TextStyle(color: isSelected ? Colors.white : Color(0xFF21471E), fontSize: 12),
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
        if (title == "PAID") {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Paidbill()));
        } else if (title == "DUE") {
          Navigator.push(context, MaterialPageRoute(builder: (context) => DueBills()));
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
    return Card(
      elevation: 2,
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(bill['icon'], size: 20, color: Colors.red),
        title: Text(bill['name'], style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(bill['amount'], style: TextStyle(fontSize: 12)),
            Text("Before: ${bill['dueDate']}", style: TextStyle(color: Colors.red, fontSize: 12)),
          ],
        ),
        trailing: Icon(Icons.chevron_right, size: 30, color: Colors.grey),
      ),
    );
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
}
