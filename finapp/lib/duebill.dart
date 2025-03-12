import 'package:finapp/bankloan.dart';
import 'package:finapp/unpaidbill.dart';
import 'package:finapp/overview.dart';
import 'package:finapp/paidbill.dart';
import 'package:flutter/material.dart';

class DueBills extends StatefulWidget {
  @override
  _DueBillsState createState() => _DueBillsState();
}

class _DueBillsState extends State<DueBills> {
   final List<String> _tabs = ["BANKS & LOANS", "OVERVIEW", "SPENT", "SAVINGS", "BILLS"];
  final List<Map<String, dynamic>> dueBills = [
    {
      'name': 'NETFLIX',
      'amount': 'Rs.300',
      'dueDate': '25-02-2025',
      'icon': Icons.tv
    },
    {
      'name': 'ELECTRICITY',
      'amount': 'Rs.500',
      'dueDate': '01-03-2025',
      'icon': Icons.flash_on
    },
    {
      'name': 'AMAZON PRIME',
      'amount': 'Rs.299',
      'dueDate': '08-03-2025',
      'icon': Icons.shopping_cart
    },
    {
      'name': 'SPOTIFY',
      'amount': 'Rs.199',
      'dueDate': '15-03-2025',
      'icon': Icons.music_note
    },
    {
      'name': 'INTERNET BILL',
      'amount': 'Rs.700',
      'dueDate': '20-03-2025',
      'icon': Icons.wifi
    },
  ];

  String selectedFilter = "BILLS"; // Default selected filter
  String selectedTab = "DUE"; // Default to Due Tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BILLS", style: TextStyle(fontWeight: FontWeight.w400,color: Color(0xFF21471E))),
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: [Icon(Icons.person)],
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Filter buttons
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _tabs.map((tab) => _buildFilterButton(tab)).toList(),
              ),
            ),
            SizedBox(height: 20),
            // Centered Tabs for Unpaid, Paid, Due
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: ["UNPAID", "PAID", "DUE"].map((tab) => _buildTabButton(tab)).toList(),

              ),
            ),
            SizedBox(height: 30),
            // Selected Tab Header
            Text(selectedTab,
                style: TextStyle(
                    color: Colors.orange, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            // Due Bills Section
            Expanded(
              child: ListView.builder(
                itemCount: dueBills.length,
                itemBuilder: (context, index) {
                  return _buildBillCard(dueBills[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build filter buttons with dynamic selection
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
          style: TextStyle(
              color: isSelected ? Colors.white : Color(0xFF21471E), fontSize: 12),
        ),
      ),
    );
  }

  // Function to build tab buttons with dynamic selection
  Widget _buildTabButton(String title) {
    bool isSelected = selectedTab == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = title;
        });
        // Navigate to different screens based on the tab selected
        if (title == "PAID") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Paidbill()),
          );
        } else if (title == "UNPAID") {
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
            style: TextStyle(
                color: isSelected ? Colors.white : Color(0xFF21471E), fontSize: 12),
          ),
        ),
      ),
    );
  }

  // Function to build bill cards for DUE bills
  Widget _buildBillCard(Map<String, dynamic> bill) {
    return Card(
      elevation: 2,
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(Icons.warning,
            size: 20, color: Colors.orange), // Due warning icon
        title: Text(
          bill['name'],
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 12, ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(bill['amount'],
                style: TextStyle(fontSize: 12,)),
            Text("Due on: ${bill['dueDate']}",
                style: TextStyle(color: Colors.orange, fontSize: 12)),
          ],
        ),
        trailing: Icon(Icons.chevron_right, size: 30, color: Colors.grey),
      ),
    );
  }
}
