import 'package:flutter/material.dart';

class CallsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: calls.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(calls[index].imageUrl),
          ),
          title: Text(calls[index].name),
          subtitle: Text(calls[index].callTime),
          trailing: Icon(
            calls[index].callType == CallType.incoming
                ? Icons.call_received
                : Icons.call_made,
            color: calls[index].callType == CallType.incoming
                ? Colors.green
                : Colors.blue,
          ),
        );
      },
    );
  }
}

enum CallType { incoming, outgoing }

class Call {
  final String name;
  final String imageUrl;
  final String callTime;
  final CallType callType;

  Call({
    required this.name,
    required this.imageUrl,
    required this.callTime,
    required this.callType,
  });
}

List<Call> calls = [
  Call(
    name: 'John Doe',
    imageUrl: 'URL_TO_IMAGE',
    callTime: 'Today, 11:30 AM',
    callType: CallType.incoming,
  ),
];
