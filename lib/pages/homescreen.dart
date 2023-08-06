import 'package:flutter/material.dart';
import 'package:waclone/main.dart';
import 'package:waclone/pages/chattab.dart';
import 'package:waclone/pages/status.dart';
import 'package:waclone/pages/community.dart';
import 'package:waclone/pages/calls.dart';
import 'package:waclone/pages/models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff128C7E),
          title: Text('WhatsApp'),
          actions: [
            IconButton(
              icon: Icon(Icons.camera_alt_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            PopupMenuButton(
                itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 0,
                        child: Text('New group'),
                      ),
                      const PopupMenuItem(
                        value: 1,
                        child: Text('New broadcast'),
                      ),
                      const PopupMenuItem(
                        value: 2,
                        child: Text('Linked devices'),
                      ),
                      const PopupMenuItem(
                        value: 3,
                        child: Text('Starred messages'),
                      ),
                      const PopupMenuItem(
                        value: 4,
                        child: Text('Payments'),
                      ),
                      const PopupMenuItem(
                        value: 5,
                        child: Text('Settings'),
                      ),
                    ])
          ],
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.group_add_rounded)),
              Tab(text: 'Chats'),
              Tab(text: 'Status'),
              Tab(text: 'Calls'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CommunityTab(),
            ChatsTab(),
            StatusTab(),
            CallsTab(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.chat),
        ),
      ),
    );
  }
}
