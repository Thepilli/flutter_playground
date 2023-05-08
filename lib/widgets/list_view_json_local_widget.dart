import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/user_url.dart';

class ListViewJsonLocalWidget extends StatefulWidget {
  const ListViewJsonLocalWidget({super.key});

  @override
  State<ListViewJsonLocalWidget> createState() =>
      _ListViewJsonLocalWidgetState();
}

class _ListViewJsonLocalWidgetState extends State<ListViewJsonLocalWidget> {
  late Future<List<UserUrl>> usersFuture;

  @override
  void initState() {
    super.initState();
    usersFuture = getUsers(context);
  }

  static Future<List<UserUrl>> getUsers(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/users.json');
    final body = json.decode(data);
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
              child: Text(user.id.toString(),
                  style: const TextStyle(fontSize: 10)),
            ),
            title: Text(user.username),
            subtitle: Text(user.email),
          ),
        );
      },
    );
