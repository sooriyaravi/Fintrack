import 'package:finapp/negotiation.dart';
import 'package:finapp/overview.dart';
import 'package:finapp/profile.dart';
import 'package:flutter/material.dart';
import 'package:finapp/unpaidbill.dart';

class BankLoansScreen extends StatefulWidget {
  const BankLoansScreen({super.key});

  @override
  State<BankLoansScreen> createState() => _BankLoansScreenState();
}

class _BankLoansScreenState extends State<BankLoansScreen> {
  int _selectedTabIndex = 0; // Default selected tab (BANKS & LOANS)

  final List<String> _tabs = ["BANKS & LOANS", "OVERVIEW", "SPENT", "SAVINGS", "BILLS"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        title: const Text(
          "BANKS & LOANS",
          style: TextStyle(color: Color(0xFF21471E), fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.person, color: Color(0xFF21471E)),
          SizedBox(width: 10),
        ],
      ),
      drawer: _buildDrawer(context), // Calling the drawer function
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Negotiation()),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.account_balance, size: 30, color: Color(0xFF21471E)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Negotiate with Banks",
                            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Color(0xFF21471E)),
                          ),
                          Text(
                            "With our AI Negotiator",
                            style: TextStyle(color: Color(0xFF21471E).withOpacity(0.7), fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 18, color: Color(0xFF21471E)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Similar Offers List
            const Text(
              "SIMILAR OFFERS",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _offerCard("INDIAN BANK", "Loan Offer", "-5% Interest", Colors.red),
                  _offerCard("HDFC BANK", "Fixed Deposit", "+2% Interest", Colors.green),
                  _offerCard("INDIAN BANK", "Loan Offer", "-5% Interest", Colors.red),
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
          _selectedTabIndex = index;
        });

        if (text == "BILLS") {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Unpaidbill()));
        } else if (text == "OVERVIEW") {
          Navigator.push(context, MaterialPageRoute(builder: (context) => OverviewPage()));
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF21471E) : Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            text,
            style: TextStyle(color: isSelected ? Colors.white : const Color(0xFF21471E), fontSize: 12),
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
          const Icon(Icons.account_balance, size: 30, color: Color(0xFF21471E)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(bankName, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Color(0xFF21471E))),
                Text(offerType, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                Text(interest, style: TextStyle(color: interestColor, fontWeight: FontWeight.w400, fontSize: 12)),
              ],
            ),
          ),
          const Text(
            "View More",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Color(0xFF21471E)),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }

  /// **Drawer Function**
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Drawer Header
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF21471E),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Color(0xFF21471E)),
                ),
                const SizedBox(height: 10),
                const Text("User Name", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400)),
                const Text("useremail@example.com", style: TextStyle(color: Colors.white70, fontSize: 14)),
              ],
            ),
          ),
          _buildDrawerItem(Icons.person, "Profile", () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
          }),
          _buildDrawerItem(Icons.settings, "Settings", () {}),
          _buildDrawerItem(Icons.info, "About", () {}),
          _buildDrawerItem(Icons.help, "Help & Support", () {}),
          const Divider(),
          _buildDrawerItem(Icons.logout, "Logout", () {}),
        ],
      ),
    );
  }

  /// **Reusable Drawer Item**
  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF21471E)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w400, color: Colors.black87)),
      onTap: onTap,
    );
  }
}
