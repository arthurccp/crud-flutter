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
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void save() {
      UserProvider userProvider = UserProvider.of(context) as UserProvider;

      User user = User(
          name: controllerName.text,
          email: controllerEmail.text,
          password: controllerPassword.text);

      int usersLength = userProvider.users.length;

      userProvider.users.insert(usersLength, user);

      Navigator.popAndPushNamed(context, "/List");
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Create_User"),
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
