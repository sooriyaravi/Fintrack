import 'package:finapp/loanterm.dart';
import 'package:flutter/material.dart';

class EmiReductionPage extends StatefulWidget {
  @override
  _EmiReductionPageState createState() => _EmiReductionPageState();
}

class _EmiReductionPageState extends State<EmiReductionPage> {
  double emiAmount = 200;
  double loanTenure = 36;
  double lumpSum = 100;
  bool isemireduction = true;

  final Color themeColor = Color(0xFF21471E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text("EMI REDUCTION", style: TextStyle(color: themeColor)),
       backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        leading: Icon(Icons.menu, color: themeColor),
        actions: [Icon(Icons.person, color: themeColor)],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    _buildToggleButton("Interest Reduction", isemireduction == false, () {
      setState(() {
        isemireduction = false;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoanTermsPage()),
        );
      });
    }),
    _buildToggleButton("EMI Reduction", isemireduction == true, () {
      setState(() {
        isemireduction = true;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EmiReductionPage()),
        );
      });
    }),
  ],
),

              SizedBox(height: 20),
              _buildSlider("EMI Amount", 200, 400, emiAmount, (value) {
                setState(() => emiAmount = value);
              }),
              _buildSlider("Loan Tenure", 36, 60, loanTenure, (value) {
                setState(() => loanTenure = value);
              }),
              _buildSlider("Extra Lump Sum Payment", 100, 5000, lumpSum, (value) {
                setState(() => lumpSum = value);
              }),
              SizedBox(height: 20),
              Text("Scenario", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: themeColor)),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: _buildDataTable(),
              ),
              SizedBox(height: 20),
              Text("AI Suggestions", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: themeColor)),
              SizedBox(height: 10),
              ...List.generate(4, (index) => _buildSuggestion("This is Suggestion ${index + 1}")),
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


  Widget _buildSlider(String title, double min, double max, double value, ValueChanged<double> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: themeColor)),
        Slider(
          value: value,
          min: min,
          max: max,
          onChanged: onChanged,
          activeColor: themeColor,
        ),
        Text("Rs.${value.toInt()}", style: TextStyle(fontSize: 16, color: themeColor)),
      ],
    );
  }

  Widget _buildDataTable() {
    return DataTable(
      columnSpacing: 20,
      columns: [
        DataColumn(label: Text("Factor", style: TextStyle(fontWeight: FontWeight.bold, color: themeColor))),
        DataColumn(label: Text("Current Plan", style: TextStyle(fontWeight: FontWeight.bold, color: themeColor))),
        DataColumn(label: Text("After Adjustment", style: TextStyle(fontWeight: FontWeight.bold, color: themeColor))),
      ],
      rows: [
        _buildDataRow("EMI", "₹250", "₹240"),
        _buildDataRow("Loan Tenure", "36 Months", "33 Months"),
        _buildDataRow("Total Interest", "₹2,400", "₹2,100"),
        _buildDataRow("Total Savings", "₹0", "+300"),
        _buildDataRow("Debt Free By", "Dec 2027", "Sep 2027"),
      ],
    );
  }

  DataRow _buildDataRow(String factor, String currentPlan, String afterAdjustment) {
    return DataRow(cells: [
      DataCell(Text(factor, style: TextStyle(color: themeColor))),
      DataCell(Text(currentPlan, style: TextStyle(color: themeColor))),
      DataCell(Text(afterAdjustment, style: TextStyle(color: themeColor))),
    ]);
  }

  Widget _buildSuggestion(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(Icons.circle, size: 8, color: themeColor),
          SizedBox(width: 8),
          Expanded(child: Text(text, style: TextStyle(color: themeColor), overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }
}
