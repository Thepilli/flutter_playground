import 'package:flutter/material.dart';

import '../models/user.dart';

class ListViewJsonWidget extends StatefulWidget {
  const ListViewJsonWidget({super.key});

  @override
  State<ListViewJsonWidget> createState() => _ListViewJsonWidgetState();
}

class _ListViewJsonWidgetState extends State<ListViewJsonWidget> {
  final List<User> users = getUsers();
  static List<User> getUsers() {
    const data = [
      {
        "username": "Leanne Graham",
        "email": "Bret",
        "urlAvatar": "assets/pika.jpg",
      },
      {
        "username": "Jan Graham",
        "email": "Bret",
        "urlAvatar": "assets/pika.jpg",
      }
    ];
    return data.map<User>(User.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ListView Json'),
      ),
      body: buildUsers(users),
    );
  }
}

Widget buildUsers(List<User> users) => ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(user.urlAvatar),
            ),
            title: Text(user.username),
            subtitle: Text(user.email),
          ),
        );
      },
    );
