import 'package:finapp/bankloan.dart';
import 'package:finapp/profile.dart';
import 'package:finapp/unpaidbill.dart';
import 'package:flutter/material.dart';

class OverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text(
          'OVERVIEW',
          style: TextStyle(color: Color(0xFF2A5D27), fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF2A5D27)),
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Color(0xFF2A5D27)),
            onPressed: () {},
          )
        ],
      ),
      drawer: _buildDrawer(context), // Calling the drawer function

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTabs(context),
              SizedBox(height: 30),
              buildScoreCard(),
              buildCard('Upcoming Due Payments', [
                'Total EMIs: 5',
                'Total Loans: 2',
                'Mortgages: 1',
                'Auto-Debit Payments: 3',
                'Pending Payments: 1'
              ]),
              buildCard('Investor History', [
                'Total Distributions: \$10,000',
                'Pending Distributions: \$5,000'
              ]),
              buildCard('Loan History', ['Loans Repaid: 3', 'Active Loans: 2']),
              buildFinancialHealthCard(),
              buildCard('Forecast Allocation', ['Available Reserves: \$20,000']),
              buildCard('Key Payment Timeline', ['Payment 1 - Due Soon', 'Payment 2 - Paid']),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTabs(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          buildTab(context, 'BANKS & LOANS', false, null),
          buildTab(context, 'OVERVIEW', true, null),
          buildTab(context, 'SPENT', false, null),
          buildTab(context, 'SAVINGS', false, null),
          buildTab(context, 'BILLS', false, null),
        ],
      ),
    );
  }

  Widget buildTab(BuildContext context, String text, bool isSelected, Widget? nextPage) {
    return GestureDetector(
      onTap: () {
        if (text == "BILLS") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Unpaidbill()),
          );
        } else if (text == "BANKS & LOANS") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BankLoansScreen()),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: isSelected ? Color(0xFF2A5D27) : Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            text,
            style: TextStyle(
                color: isSelected ? Colors.white : Color(0xFF2A5D27), fontSize: 12),
          ),
        ),
      ),
    );
  }

  Widget buildScoreCard() {
    return Card(
      elevation: 3,
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'YOUR SCORE:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xFF2A5D27)),
            ),
            SizedBox(height: 8),
            Text('100/700', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400)),
            SizedBox(height: 4),
            Text('Our AI perceives your score based on your history'),
            TextButton(onPressed: () {}, child: Text('Learn More →')),
          ],
        ),
      ),
    );
  }

  Widget buildCard(String title, List<String> items) {
    return Card(
      elevation: 3,
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                Text('View More →', style: TextStyle(color: Color(0xFF2A5D27), fontSize: 10))
              ],
            ),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items.map((item) => Text('- ' + item)).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFinancialHealthCard() {
    double debtToIncome = 42;

    return Card(
      elevation: 3,
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Financial Health',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                Text('View More →', style: TextStyle(color: Color(0xFF2A5D27), fontSize: 10))
              ],
            ),
            SizedBox(height: 8),
            Text('Debt to Income: ${debtToIncome.toStringAsFixed(0)}%'),
            SizedBox(height: 4),
            LinearProgressIndicator(
              value: debtToIncome / 100,
              backgroundColor: Colors.grey[300],
              color: debtToIncome > 50 ? Colors.red : Colors.green,
              minHeight: 6,
            ),
            SizedBox(height: 8),
            Text('Missed EMIs: 2'),
            Text('Late Payment Risk Score: 7.8/10'),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF2A5D27),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Color(0xFF2A5D27)),
                ),
                SizedBox(height: 10),
                Text("User Name", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400)),
                Text("useremail@example.com", style: TextStyle(color: Colors.white70, fontSize: 14)),
              ],
            ),
          ),
          _buildDrawerItem(Icons.person, "Profile", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
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
      leading: Icon(icon, color: Color(0xFF2A5D27)),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black87)),
      onTap: onTap,
    );
  }
}
