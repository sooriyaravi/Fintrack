import 'package:finapp/overview.dart';
import 'package:flutter/material.dart';
import 'package:finapp/dashboard.dart';

class BankLoansScreen extends StatefulWidget {
  const BankLoansScreen({super.key});

  @override
  State<BankLoansScreen> createState() => _BankLoansScreenState();
}

class _BankLoansScreenState extends State<BankLoansScreen> {
  int _selectedTabIndex = 0; // Default selected tab (BANKS & LOANS)

  final List<String> _tabs = ["BANKS & LOANS", "OVERVIEW","SPENT", "SAVINGS", "BILLS"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.black),
        title: const Text(
          "BANKS & LOANS",
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

            const SizedBox(height: 40),

            // AI Negotiator Box
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(Icons.account_balance, size: 30),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Negotiate with Banks",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(
                          "With our AI Negotiator",
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios, size: 18),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Similar Offers List
            const Text(
              "SIMILAR OFFERS",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView(
                children: [
                  _offerCard("INDIAN BANK", "Loan Offer", "-5% Interest", Colors.red),
                  _offerCard("HDFC BANK", "Fixed Deposit", "+2% Interest", Colors.green),
                  _offerCard("HDFC BANK", "Fixed Deposit", "+2% Interest", Colors.green),
                  _offerCard("HDFC BANK", "Fixed Deposit", "+2% Interest", Colors.green),
                  _offerCard("HDFC BANK", "Fixed Deposit", "+2% Interest", Colors.green),
                  _offerCard("INDIAN BANK", "Loan Offer", "-5% Interest", Colors.red),
                  _offerCard("HDFC BANK", "Fixed Deposit", "+2% Interest", Colors.green),
                  _offerCard("HDFC BANK", "Fixed Deposit", "+2% Interest", Colors.green),
                  _offerCard("INDIAN BANK", "Loan Offer", "-5% Interest", Colors.red),
                  _offerCard("HDFC BANK", "Fixed Deposit", "+2% Interest", Colors.green),
                  _offerCard("HDFC BANK", "Fixed Deposit", "+2% Interest", Colors.green),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to create tab buttons (without borders)
  Widget _tabButton(String text, int index) {
    bool isSelected = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index; // Update selected tab index
        });

        if (text == "BILLS") {
          // Navigate to the BillScreen when "BILLS" is tapped
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Unpaidbill()),
          );
        }
        else if (text == "OVERVIEW") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OverviewPage()),
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
            
            fontSize: 12, // Set text size to 12
          ),
        ),
      ),
    );
  }

  // Function to create bank offer cards
  Widget _offerCard(String bankName, String offerType, String interest, Color interestColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.account_balance, size: 30),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bankName,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                Text(
                  offerType,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Text(
                  interest,
                  style: TextStyle(color: interestColor, fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ],
            ),
          ),
          const Text(
            "View More",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }
}
