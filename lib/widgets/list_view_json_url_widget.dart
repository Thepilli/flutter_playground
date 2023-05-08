import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/user_url.dart';

class ListViewJsonUrlWidget extends StatefulWidget {
  const ListViewJsonUrlWidget({super.key});

  @override
  State<ListViewJsonUrlWidget> createState() => _ListViewJsonUrlWidgetState();
}

class _ListViewJsonUrlWidgetState extends State<ListViewJsonUrlWidget> {
  Future<List<UserUrl>> usersFuture = getUsers();
  static Future<List<UserUrl>> getUsers() async {
    const url = 'https://jsonplaceholder.typicode.com/users';
    final response = await http.get(Uri.parse(url));
    final body = json.decode(response.body);
    return body.map<UserUrl>(UserUrl.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ListView Json'),
      ),
      body: Center(
        child: FutureBuilder<List<UserUrl>>(
          future: usersFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final users = snapshot.data!;
              return buildUsers(users);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

Widget buildUsers(List<UserUrl> users) => ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              child: Text(user.id.toString()),
            ),
            title: Text(user.username),
            subtitle: Text(user.email),
          ),
        );
      },
    );
