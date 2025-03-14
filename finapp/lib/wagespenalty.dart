import 'package:finapp/waierchat.dart';
import 'package:finapp/waiverprepayment.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Waivers and Penalty",
      theme: ThemeData(primarySwatch: Colors.green),
      home: Penalty(),
    );
  }
}

class Penalty extends StatefulWidget {
  @override
  _PenaltyState createState() => _PenaltyState();
}

class _PenaltyState extends State<Penalty> {
  bool isPenaltySelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "WAIVERS AND PENALTY",
          style: TextStyle(
            color: Color(0xFF21471E),
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF21471E)),
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Color(0xFF21471E)),
            onPressed: () {},
          ),
        ],
      ),
      drawer: _buildDrawer(context),
              backgroundColor: Colors.white,

      body: SingleChildScrollView(
        
        child: Column(
          
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ToggleButton(
                    text: "PENALTY",
                    isSelected: isPenaltySelected,
                    onTap: () {
                      setState(() {
                        isPenaltySelected = true;
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  ToggleButton(
                    text: "PREPAYMENT",
                    isSelected: !isPenaltySelected,
                    onTap: () {
                      setState(() {
                        isPenaltySelected = false;
                      });

                      // Navigate to Prepayment Page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Prepayment()),
                      );
                    },
                  ),
                ],
              ),
            ),
            Column(
              children: [
                BankCard(
                  bankName: "INDIAN BANK",
                  details: "Rs.100000 with 2% interest",
                  latePayment: "For 2 years, Late by 3 months",
                  destinationPage:Waierchat(),
                ),
                BankCard(
                  bankName: "SBI BANK",
                  details: "Rs.200000 with 3% interest",
                  latePayment: "For 1 year, Late by 1 month",
                  destinationPage: SBIBankDetailsPage(),
                ),
                BankCard(
                  bankName: "HDFC BANK",
                  details: "Rs.150000 with 2.5% interest",
                  latePayment: "For 3 years, Late by 2 months",
                  destinationPage: HDFCBankDetailsPage(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// **Toggle Button for Selection**
class ToggleButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  ToggleButton({required this.text, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Color(0xFF21471E) : Colors.grey[300],
        foregroundColor: isSelected ? Colors.white : Color(0xFF21471E),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(text),
    );
  }
}

/// **Reusable Bank Card for Navigation**
class BankCard extends StatelessWidget {
  final String bankName;
  final String details;
  final String latePayment;
  final Widget destinationPage;

  BankCard({
    required this.bankName,
    required this.details,
    required this.latePayment,
    required this.destinationPage,
  });

  @override
  Widget build(BuildContext context) {
    

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Card(
        
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          tileColor:Colors.white,
          leading: Icon(Icons.account_balance, size: 40, color: Color(0xFF21471E)),
          title: Text(
            bankName,
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(details, style: TextStyle(fontSize: 12)),
              Text(
                latePayment,
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
            ],
          ),
          trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Color(0xFF21471E)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => destinationPage),
            );
          },
        ),
      ),
    );
  }
}

/// **Drawer Function**
Widget _buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Color(0xFF21471E),
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
              Text(
                "User Name",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),
              ),
              Text(
                "useremail@example.com",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
        ),
        _buildDrawerItem(Icons.person, "Profile", () {}),
        _buildDrawerItem(Icons.settings, "Settings", () {}),
        _buildDrawerItem(Icons.info, "About", () {}),
        _buildDrawerItem(Icons.help, "Help & Support", () {}),
        Divider(),
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

class SBIBankDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SBI Bank Details")),
      body: Center(child: Text("Details about SBI Bank loan.")),
    );
  }
}

class HDFCBankDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HDFC Bank Details")),
      body: Center(child: Text("Details about HDFC Bank loan.")),
    );
  }
}

