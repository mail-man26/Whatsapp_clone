import 'package:flutter/material.dart';
import 'package:waclone/pages/chatscreen.dart';
import 'package:waclone/pages/models.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class ChatsTab extends StatefulWidget {
  @override
  _ChatsTabState createState() => _ChatsTabState();
}

class _ChatsTabState extends State<ChatsTab> {
  late Future<List<Chat>> _chatsFuture;

  Future<List<Chat>> loadChatsFromJson() async {
    String jsonData = await rootBundle.loadString('assets/chats_data.json');
    List<dynamic> jsonList = json.decode(jsonData);

    List<Chat> chats = [];
    for (dynamic jsonChat in jsonList) {
      List<Message> messages = [];
      for (dynamic jsonMessage in jsonChat['messages']) {
        messages
            .add(Message(text: jsonMessage['text'], isMe: jsonMessage['isMe']));
      }

      Chat chat = Chat(
        name: jsonChat['name'],
        imageUrl: jsonChat['imageUrl'],
        lastMessage: jsonChat['lastMessage'],
        lastMessageTime: jsonChat['lastMessageTime'],
        messages: messages,
      );
      chats.add(chat);
    }

    return chats;
  }

  @override
  void initState() {
    super.initState();
    _chatsFuture = loadChatsFromJson();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Chat>>(
      future: _chatsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error loading chats');
        } else if (snapshot.hasData) {
          List<Chat> chats = snapshot.data!;
          return ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: GestureDetector(
                  onTap: () {
                    _openProfile(context, chats[index]);
                  },
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(chats[index].imageUrl),
                  ),
                ),
                title: Text(chats[index].name),
                subtitle: Text(chats[index].lastMessage),
                trailing: Text(chats[index].lastMessageTime),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(chat: chats[index]),
                    ),
                  );
                },
              );
            },
          );
        } else {
          return Text('No chats available');
        }
      },
    );
  }

  void _openProfile(BuildContext context, Chat chat) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(chat.imageUrl),
                fit: BoxFit.cover,
              ),
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }
}
