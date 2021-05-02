import 'package:flutter/material.dart';
import 'package:shop/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/welcome.png",
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Welcome $name",
                  style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter Username", labelText: "Username"),
                        onChanged: (val) {
                          setState(() {
                            name = val;
                          });
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Password can't be empty";
                          } else if (value.length <= 6) {
                            return "Password length should be more than 6";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter password",
                          labelText: "Password",
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Username can't be empty";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Material(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(100),
                  child: InkWell(
                    onTap: () => moveToHome(context),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      height: 50,
                      width: changeButton ? 50 : 150,
                      alignment: Alignment.center,
                      child: changeButton
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                )
                // ElevatedButton(
                //   child: Text("Login"),
                //   style: TextButton.styleFrom(
                //     minimumSize: Size(150, 50),
                //   ),
                //   onPressed: () {
                //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
