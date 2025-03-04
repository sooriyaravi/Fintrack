import 'package:finapp/bankloan.dart';
import 'package:finapp/dashboard.dart';
import 'package:flutter/material.dart';

class SavingsScreen extends StatefulWidget {
  const SavingsScreen({super.key});

  @override
  State<SavingsScreen> createState() => _SavingsScreenState();
}

class _SavingsScreenState extends State<SavingsScreen> {
  int _selectedTabIndex = 1; // Default selected tab (SAVINGS)

  final List<String> _tabs = ["BANKS & LOANS", "OVERVIEW","SPENT", "SAVINGS", "BILLS"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.black),
        title: const Text(
          "SAVINGS",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.person, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Scrollable Tab Buttons
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(_tabs.length, (index) {
                  return _tabButton(_tabs[index], index);
                }),
              ),
            ),
            const SizedBox(height: 20),
            _amountSavedCard(),
            const SizedBox(height: 20),
            _simpleBox(),
            const SizedBox(height: 20),
            _yourSavingsCard(),
          ],
        ),
      ),
    );
  }

  Widget _tabButton(String text, int index) {
    bool isSelected = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
         if (text == "BANKS & LOANS") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BankLoansScreen()),
          );
        } else if (text == "BILLS") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Unpaidbill()),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _amountSavedCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("AMOUNT SAVED", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text("Rs. 2,405", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green)),
            SizedBox(height: 5),
            Text("+33% month over month", style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _simpleBox() {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("MONTHLY SAVINGS", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text("Simple Box Content Here", style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget _yourSavingsCard() {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("YOUR SAVINGS", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text("YOUR TARGET: Rs. 2300", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green)),
            SizedBox(height: 10),
            Text("Amount Spent       Rs. 45678.90"),
            Text("Amount Saved       Rs. 2405"),
            Text("Profit                     5.00%"),
          ],
        ),
      ),
    );
  }
}
