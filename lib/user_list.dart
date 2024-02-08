import 'package:flutter/material.dart';
import 'package:meu_app/user.dart';
import 'package:meu_app/user_provider.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = UserProvider.of(context) as UserProvider;
    List<User> users = userProvider.users;

    int userLength = users.length;

    return Scaffold(
      appBar: AppBar(
        title: Text("User List"),
        leading: BackButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, "/create");
          },
        ),
      ),
      body: ListView.builder(
          itemCount: userLength,
          itemBuilder: (BuildContext contextBuilder, indexBuilder) => Container(
                child: ListTile(
                  title: Text(users[indexBuilder].name),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            userProvider.indexUser = null;
                            userProvider.userSelected = users[indexBuilder];
                            userProvider.indexUser = indexBuilder;
                            Navigator.popAndPushNamed(context, "/create");
                          },
                          icon: Icon(Icons.edit))
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 0.4))),
              )),
    );
  }
}
