import 'package:finapp/bankloan.dart';
import 'package:finapp/emireduction.dart';
import 'package:finapp/profile.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class LoanTermsPage extends StatefulWidget {
  @override
  _LoanTermsPageState createState() => _LoanTermsPageState();
}

class _LoanTermsPageState extends State<LoanTermsPage> {
  double interestRate = 12;
  double extraPayment = 50;
  double termAdjustment = 36;
  double loanAmount = 10000; // Default loan amount
  bool isInterestReduction = true;

  double calculateEMI(double principal, double rate, double tenure) {
    double monthlyRate = rate / (12 * 100);
    return (principal * monthlyRate * pow(1 + monthlyRate, tenure)) /
        (pow(1 + monthlyRate, tenure) - 1);
  }

  double calculateTotalInterest(double emi, double tenure, double principal) {
    return (emi * tenure) - principal;
  }

  @override
  Widget build(BuildContext context) {
    double currentEMI = calculateEMI(loanAmount, interestRate, termAdjustment);
    double adjustedEMI = calculateEMI(loanAmount - extraPayment, interestRate - 1, termAdjustment - 6);
    double totalInterestBefore = calculateTotalInterest(currentEMI, termAdjustment, loanAmount);
    double totalInterestAfter = calculateTotalInterest(adjustedEMI, termAdjustment - 6, loanAmount - extraPayment);
    double savings = totalInterestBefore - totalInterestAfter;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Text("LOAN TERMS", style: TextStyle(color: Color(0xFF21471E))),
        centerTitle: true,
        actions: [IconButton(onPressed: () {
          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BankLoansScreen()),
                          );
        }, icon: Icon(Icons.person, color: Color(0xFF21471E)))],
        iconTheme: IconThemeData(color: Color(0xFF21471E)),
      ),
           drawer: _buildDrawer(context), // Calling the drawer function

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildToggleButton("Interest Reduction", isInterestReduction, () {
                    setState(() {
                      isInterestReduction = true;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoanTermsPage()),
                      );
                    });
                  }),
                  _buildToggleButton("EMI Reduction", !isInterestReduction, () {
                    setState(() {
                      isInterestReduction = false;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EmiReductionPage()),
                      );
                    });
                  }),
                ],
              ),
              SizedBox(height: 20),
              _buildSlider("Interest Rate", interestRate, 9, 12, "%", (value) => setState(() => interestRate = value)),
              _buildSlider("Extra Monthly Payment", extraPayment, 50, 500, "Rs.", (value) => setState(() => extraPayment = value)),
              _buildSlider("Term Adjustment", termAdjustment, 36, 60, "M", (value) => setState(() => termAdjustment = value)),
              SizedBox(height: 20),
              _buildScenarioTable(currentEMI, adjustedEMI, totalInterestBefore, totalInterestAfter, savings),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF21471E)),
                  child: Text("Apply Plan", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButton(String text, bool isActive, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        margin: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: isActive ? Color(0xFF21471E) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color(0xFF21471E)),
        ),
        child: Text(
          text,
          style: TextStyle(color: isActive ? Colors.white : Color(0xFF21471E)),
        ),
      ),
    );
  }

  Widget _buildSlider(String title, double value, double min, double max, String unit, Function(double) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.w400, color: Color(0xFF21471E))),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${min.toInt()}$unit", style: TextStyle(color: Color(0xFF21471E))),
            Text("${max.toInt()}$unit", style: TextStyle(color: Color(0xFF21471E))),
          ],
        ),
        Slider(
          value: value,
          min: min,
          max: max,
          onChanged: onChanged,
          activeColor: Color(0xFF21471E),
        ),
      ],
    );
  }

  Widget _buildScenarioTable(double currentEMI, double adjustedEMI, double interestBefore, double interestAfter, double savings) {
    return Table(
      border: TableBorder.all(),
      columnWidths: {0: FlexColumnWidth(2), 1: FlexColumnWidth(1), 2: FlexColumnWidth(1)},
      children: [
        _buildTableRow(["Factor", "Current Plan", "After Adjustment"], isHeader: true),
        _buildTableRow(["EMI", "Rs${currentEMI.toStringAsFixed(2)}", "Rs${adjustedEMI.toStringAsFixed(2)}"]),
        _buildTableRow(["Remaining Tenure", "${termAdjustment.toInt()} Months", "${(termAdjustment - 6).toInt()} Months"]),
        _buildTableRow(["Total Interest", "Rs${interestBefore.toStringAsFixed(2)}", "Rs${interestAfter.toStringAsFixed(2)}"]),
        _buildTableRow(["Total Savings", "Rs0", "Rs${savings.toStringAsFixed(2)}"]),
      ],
    );
  }

  TableRow _buildTableRow(List<String> values, {bool isHeader = false}) {
    return TableRow(
      children: values
          .map((text) => Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: TextStyle(fontWeight: isHeader ? FontWeight.w400 : FontWeight.normal, color: Color(0xFF21471E)),
                ),
              ))
          .toList(),
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
