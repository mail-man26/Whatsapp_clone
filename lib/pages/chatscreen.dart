import 'package:flutter/material.dart';
import 'package:waclone/Widgets/ChatBottomBar.dart';
import 'package:waclone/pages/models.dart'; // Import the models.dart file

class ChatScreen extends StatelessWidget {
  final Chat chat;

  ChatScreen({required this.chat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          backgroundColor: Color(0xff128C7E),
          leading: Padding(
            padding: EdgeInsets.only(top: 10, left: 5),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                size: 25,
              ),
            ),
          ),
          leadingWidth: 20,
          title: Padding(
            padding: EdgeInsets.only(top: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    chat.imageUrl,
                    height: 45,
                    width: 45,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chat.name,
                        style: TextStyle(fontSize: 19),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'online',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.video_call),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.call),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://user-images.githubusercontent.com/15075759/28719144-86dc0f70-73b1-11e7-911d-60d70fcded21.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 80),
          child: Column(
            children: [
              Container(
                width: 300,
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xFFFFF3C2),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: const Text(
                  'Messages and calls are end-to-end encrypted. No one outside of this chat can read or listen. Tap to learn more',
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: chat.messages.length,
                  itemBuilder: (context, index) {
                    return MessageWidget(message: chat.messages[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: ChatBotomBar(),
    );
  }
}

class MessageWidget extends StatelessWidget {
  final Message message;

  MessageWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: message.isMe ? Colors.greenAccent : Colors.grey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          message.text,
          style: TextStyle(
            color: message.isMe ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
