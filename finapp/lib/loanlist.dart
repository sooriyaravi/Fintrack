import 'package:finapp/loanterm.dart';
import 'package:flutter/material.dart';

class LoanListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
             backgroundColor: Color.fromARGB(255, 255, 255, 255),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Color(0xFF21471E)),
          onPressed: () {},
        ),
        title: Text(
          'LOANS AVAILABLE',
          style: TextStyle(color: Color(0xFF21471E), fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: Color(0xFF21471E)),
            onPressed: () {},
          ),
        ],
      ),
      body:
       
      ListView.separated(
        
        padding: EdgeInsets.all(10),
        itemCount: 5,
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              leading: Icon(Icons.account_balance, size: 35, color: Color(0xFF21471E)),
              title: Text(
                'INDIAN BANK',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Color(0xFF21471E)), // Medium size
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Rs.100000 with 2% interest', style: TextStyle(fontSize: 14)), // Medium size
                  Text('2 years', style: TextStyle(color: Color(0xFF21471E), fontSize: 14)), // Medium size
                ],
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFF21471E)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoanTermsPage()),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
