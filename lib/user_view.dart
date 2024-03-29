import 'package:flutter/material.dart';
import 'package:meu_app/field_form.dart';
import 'package:meu_app/user.dart';
import 'package:meu_app/user_provider.dart';

class UserView extends StatelessWidget {
  UserView({super.key});

  String title = "Show User";
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = UserProvider.of(context) as UserProvider;

    int? index;
    if (userProvider.indexUser != null) {
      index = userProvider.indexUser;
      controllerName.text = userProvider.userSelected!.name;
      controllerEmail.text = userProvider.userSelected!.email;
      controllerPassword.text = userProvider.userSelected!.password;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        actions: [
          Container(
            child: TextButton(
              child: Text("UserList"),
              onPressed: () {
                Navigator.popAndPushNamed(context, "/List");
              },
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            margin: EdgeInsets.all(8),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            FieldForm(
                label: "Name",
                isPasword: false,
                controller: controllerName,
                isForm: false),
            FieldForm(
                label: "Email",
                isPasword: false,
                controller: controllerEmail,
                isForm: false),
            FieldForm(
                label: "Password",
                isPasword: false,
                controller: controllerPassword,
                isForm: false),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, "/create");
                },
                child: Text("Edit"),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).primaryColor),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  userProvider.indexUser = null;
                  userProvider.users.removeAt(index!);
                  Navigator.popAndPushNamed(context, "/create");
                },
                child: Text("delete"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
