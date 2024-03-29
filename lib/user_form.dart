import 'package:flutter/material.dart';
import 'package:meu_app/field_form.dart';
import 'package:meu_app/user.dart';
import 'package:meu_app/user_provider.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  String title = "Create User";
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
      print("save");
      setState(() {
        this.title = "Edit User";
      });
    }
    void save() {
      User user = User(
          name: controllerName.text,
          email: controllerEmail.text,
          password: controllerPassword.text);

      if (index != null) {
        userProvider.users[index] = user;
      } else {
        int usersLength = userProvider.users.length;

        userProvider.users.insert(usersLength, user);
      }

      Navigator.popAndPushNamed(context, "/List");
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
                label: "Name", isPasword: false, controller: controllerName),
            FieldForm(
                label: "Email", isPasword: false, controller: controllerEmail),
            FieldForm(
                label: "Password",
                isPasword: true,
                controller: controllerPassword),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: save,
                child: Text("Salvar"),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).primaryColor),
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
