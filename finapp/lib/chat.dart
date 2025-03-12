import 'package:flutter/material.dart';



class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, String>> messages = [
    {"role": "bot", "text": "Hi! Welcome to Indian Bank.\nWhat would you like to inquire about?"},
    {"role": "user", "text": "Give me the negotiation details."},
    {"role": "bot", "text": "The Negotiation is as follows\nHas some Conditions and Rules to be followed.\nLet me know if you want further details."}
  ];

  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;

    setState(() {
      messages.add({"role": "user", "text": _controller.text.trim()});
    });

    _controller.clear();
  }

  Widget _buildMessage(String text, bool isUser) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: EdgeInsets.all(12),
        constraints: BoxConstraints(maxWidth: 280),
        decoration: BoxDecoration(
          color: isUser ? Colors.blue.shade100 : Colors.green.shade100,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        title: Text("Indian Bank", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(icon: Icon(Icons.lightbulb, color: Colors.white), onPressed: () {})
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final isUser = messages[index]["role"] == "user";
                return _buildMessage(messages[index]["text"]!, isUser);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Type 'Start' to begin Negotiating...",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                FloatingActionButton(
                  backgroundColor: Colors.green.shade700,
                  child: Icon(Icons.send, color: Colors.white),
                  onPressed: _sendMessage,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
