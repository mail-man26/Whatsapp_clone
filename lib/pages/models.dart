class Chat {
  final String name;
  final String imageUrl;
  final String lastMessage;
  final String lastMessageTime;
  final List<Message> messages;

  Chat({
    required this.name,
    required this.imageUrl,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.messages,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      name: json['name'],
      imageUrl: json['imageUrl'],
      lastMessage: json['lastMessage'],
      lastMessageTime: json['lastMessageTime'],
      messages: (json['messages'] as List)
          .map((messageJson) => Message.fromJson(messageJson))
          .toList(),
    );
  }
}

class Message {
  final String text;
  final bool isMe;

  Message({required this.text, required this.isMe});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      text: json['text'],
      isMe: json['isMe'],
    );
  }
}
