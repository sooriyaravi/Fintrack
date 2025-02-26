import 'package:finapp/dashboard.dart';
import 'package:finapp/duebill.dart';
import 'package:finapp/overview.dart';
import 'package:flutter/material.dart';

class Paidbill extends StatefulWidget {
  @override
  _BillsScreenState createState() => _BillsScreenState();
}

class _BillsScreenState extends State<Paidbill> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFilterButton("BILLS"),
                _buildFilterButton("OVERVIEW"),
                _buildFilterButton("SPENT"),
                _buildFilterButton("SAVINGS"),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildTabButton("UNPAID"),
                  _buildTabButton("PAID"),
                  _buildTabButton("DUE"),
                ],
              ),
            ),
            SizedBox(height: 30),
            Text(selectedTab, style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
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
      }},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontSize: 12),
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
        if (title == "UNPAID") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Unpaidbill()),
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
            style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontSize: 12),
          ),
        ),
      ),
    );
  }

  Widget _buildBillCard(Map<String, dynamic> bill) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9, // Reduced width
      decoration: BoxDecoration(
        border: selectedTab == "DUE" ? Border.all(color: Colors.red, width: 2) : null,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(vertical: 6),
      child: Card(
        elevation: 2,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: Icon(Icons.check_circle, size: 20, color: Colors.green),
          title: Text(
            bill['name'],
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(bill['amount'], style: TextStyle(fontSize: 12,)),
              Text("Paid on: ${bill['paidDate']}", style: TextStyle(color: Colors.green, fontSize: 12)),
            ],
          ),
          trailing: Icon(Icons.chevron_right, size: 30, color: Colors.grey),
        ),
      ),
    );
  }
}
