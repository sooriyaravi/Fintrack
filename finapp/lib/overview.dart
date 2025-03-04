import 'package:finapp/bankloan.dart';
import 'package:finapp/dashboard.dart';
import 'package:flutter/material.dart';

class OverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'OVERVIEW',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
              icon: Icon(Icons.person, color: Colors.black), onPressed: () {})
        ],
      ),
      drawer: Drawer(),
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
              buildFinancialHealthCard(), // Updated financial health with a progress bar
              buildCard(
                  'Forecast Allocation', ['Available Reserves: \$20,000']),
              buildCard('Key Payment Timeline',
                  ['Payment 1 - Due Soon', 'Payment 2 - Paid']),
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

  Widget buildTab(
      BuildContext context, String text, bool isSelected, Widget? nextPage) {
    return GestureDetector(
      onTap: () {
        if (text == "BILLS") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Unpaidbill()),
          );
        }
         else if (text == "BANKS & LOANS") {
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
            color: isSelected ? Colors.black : Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            text,
            style: TextStyle(
                color: isSelected ? Colors.white : Colors.black, fontSize: 12),
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
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            SizedBox(height: 8),
            Text('100/700',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
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
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text('View More →',
                    style: TextStyle(color: Colors.green, fontSize: 10))
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
    double debtToIncome = 42; // 42% debt to income ratio

    return Card(
      elevation: 3,
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
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text('View More →',
                    style: TextStyle(color: Colors.green, fontSize: 10))
              ],
            ),
            SizedBox(height: 8),
            Text('Debt to Income: ${debtToIncome.toStringAsFixed(0)}%'),
            SizedBox(height: 4),
            LinearProgressIndicator(
              value: debtToIncome / 100, // Convert percentage to a scale of 0-1
              backgroundColor: Colors.grey[300],
              color: debtToIncome > 50
                  ? Colors.red
                  : Colors.green, // Red if high, green if safe
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
}
