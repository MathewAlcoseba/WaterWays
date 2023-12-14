import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waterways/OrderManagement/custom_appbar2.dart';
import 'package:waterways/OrderManagement/custom_appbar_storedetails.dart';

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Messenger',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Poppins', // Set the default font family to Poppins
      ),
      home: ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _textController = TextEditingController();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Colors.blue),
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.attach_file),
              onPressed: () {},
            ),
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  controller: _textController,
                  onSubmitted: _handleSubmitted,
                  decoration: InputDecoration(
                    hintText: "Send a message",
                    border: InputBorder.none, // Remove underline
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text),
                color: Colors.blue, // Blue icon color (alternative way)
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Pop the current screen
          },
        ),
        title: RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: "Order History",
            style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.w600,
              color: Color(0xFF313144),
            ),
            children: <TextSpan>[
              TextSpan(
                text: '\nGHTH7821B-Y2-90I',
                style: GoogleFonts.gothicA1(
                  color: Color(0xFF6F6F6F),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Color(0xFF007AFF), // Set the selected label color
          unselectedLabelColor:
              Color(0xFF313144), // Set the unselected label color
          labelStyle: GoogleFonts.poppins(
            // Apply Poppins font for labels
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
              color: Color(0xFF007AFF), // Set the indicator (underline) color
              width: 2.0,
            ),
          ),
          tabs: [
            Tab(text: 'Store'),
            Tab(text: 'Delivery'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildStoreChat(),
          _buildRiderChat(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Theme.of(context).canvasColor),
        child: _buildTextComposer(),
      ),
    );
  }

  Widget _buildStoreChat() {
    // Using existing chat fields for the Store tab
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: <Widget>[
        ChatMessage(
            messageContent: "Hi, your order is on the way!",
            messageType: "receiver"),

        ChatMessage(
          isImage: true,
          messageType: "receiver",
          messageContent: '',
        ),

        ChatMessage(
          messageContent: "I appreciate the update",
          messageType: "sender",
        ),
        // ... Rest of your existing chat messages ...
      ],
    );
  }

  Widget _buildRiderChat() {
    // Create new chat fields and placeholders for the Rider tab
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: <Widget>[
        // Example placeholder messages
        ChatMessage(
            messageContent: "Hello, I'm the rider.", messageType: "receiver"),
        ChatMessage(
          messageContent: "Please let me know when you arrive.",
          messageType: "sender",
        ),
      ],
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String messageContent;
  final String messageType;
  final bool isImage;

  ChatMessage(
      {required this.messageContent,
      required this.messageType,
      this.isImage = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: messageType == "receiver"
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: <Widget>[
          if (messageType == "receiver" && !isImage)
            CircleAvatar(child: Text("R")), // Placeholder for user avatar
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: messageType == "receiver"
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.end,
            children: <Widget>[
              if (isImage)
                Image.asset('assets/Order/barrel.png', width: 200, height: 150)
              else
                Container(
                  decoration: BoxDecoration(
                    color: messageType == "receiver"
                        ? Colors.grey[200]
                        : Colors.blue[400],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    messageContent,
                    style: TextStyle(
                      color: messageType == "receiver"
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(width: 10),
          if (messageType == "sender" && !isImage)
            CircleAvatar(child: Text("S")), // Placeholder for user avatar
        ],
      ),
    );
  }
}
