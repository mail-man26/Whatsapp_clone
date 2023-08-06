import 'package:flutter/material.dart';

class StatusTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: statuses.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(statuses[index].imageUrl),
          ),
          title: Text(statuses[index].name),
          subtitle: Text(statuses[index].statusTime),
        );
      },
    );
  }
}

class Status {
  final String name;
  final String imageUrl;
  final String statusTime;

  Status({
    required this.name,
    required this.imageUrl,
    required this.statusTime,
  });
}

List<Status> statuses = [
  Status(
    name: 'Alice Smith',
    imageUrl: 'URL_TO_IMAGE',
    statusTime: 'Today, 10:00 AM',
  ),
  // Add more statuses here
];
