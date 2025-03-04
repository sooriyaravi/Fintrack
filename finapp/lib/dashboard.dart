import 'package:finapp/bankloan.dart';
import 'package:finapp/overview.dart';
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
    {
      'name': 'NETFLIX',
      'amount': 'Rs.300',
      'dueDate': '28-02-2025',
      'icon': Icons.tv
    },
    {
      'name': 'ELECTRICITY',
      'amount': 'Rs.300',
      'dueDate': '02-03-2025',
      'icon': Icons.flash_on
    },
    {
      'name': 'AMAZON PRIME',
      'amount': 'Rs.300',
      'dueDate': '10-03-2025',
      'icon': Icons.shopping_cart
    },
    {
      'name': 'NETFLIX',
      'amount': 'Rs.300',
      'dueDate': '18-03-2025',
      'icon': Icons.tv
    },
    {
      'name': 'NETFLIX',
      'amount': 'Rs.300',
      'dueDate': '29-03-2025',
      'icon': Icons.tv
    },
  ];

  String selectedFilter = "BILLS"; // Default selected filter
  String selectedTab = "UNPAID"; // Default selected tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BILLS", style: TextStyle(fontWeight: FontWeight.bold)),
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
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            // Unpaid Bills Section
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
          color: isSelected ? Colors.black : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(
              color: isSelected ? Colors.white : Colors.black, fontSize: 12),
        ),
      ),
    );
  }

  // Function to build tab buttons with navigation
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
        } else if (title == "DUE") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DueBills()),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: isSelected ? Colors.black : Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            title,
            style: TextStyle(
                color: isSelected ? Colors.white : Colors.black, fontSize: 12),
          ),
        ),
      ),
    );
  }

  // Function to build bill cards
  Widget _buildBillCard(Map<String, dynamic> bill) {
    return Card(
      elevation: 2,
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(bill['icon'], size: 20, color: Colors.red),
        title: Text(
          bill['name'],
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(bill['amount'], style: TextStyle(fontSize: 12)),
            Text("Before: ${bill['dueDate']}",
                style: TextStyle(color: Colors.red, fontSize: 12)),
          ],
        ),
        trailing: Icon(Icons.chevron_right, size: 30, color: Colors.grey),
      ),
    );
  }
}
