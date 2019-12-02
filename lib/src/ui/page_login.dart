import 'package:exampletododevindo/src/blocs/bloc_login.dart';
import 'package:exampletododevindo/src/data/session.dart';
import 'package:exampletododevindo/src/ui/page_home.dart';
import 'package:exampletododevindo/src/utils/custom_widget/toast.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              onChanged: blocLogin.updateUsername,
              decoration: InputDecoration(hintText: 'Username'),
            ),
            TextField(
              onChanged: blocLogin.updatePassword,
              obscureText: true,
              decoration: InputDecoration(hintText: 'Password'),
            ),
            RaisedButton(
              onPressed: () async {
                var addLogin = await blocLogin.addLogin();
                print(addLogin);
                if (addLogin) {
                  Session.setLoggedIn(true);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage(title: "Home",)));
                } else {
                  return CustomToast.show("Gagal Login");
                }

                // Navigator.of(context).pop();
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
