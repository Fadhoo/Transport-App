import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(child: _LoginContent()),
    );
  }
}

class _LoginContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginContentState();
  }
}

class _LoginContentState extends State<_LoginContent> {
  final _loginContentKey = GlobalKey<_LoginContentState>();
  bool isSignInToggle = true;
  static final String signInText = "SIGN IN";
  static final String registerText = "REGISTER";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  getButtonTab(_LoginContentState.signInText, isSignInToggle),
                  SizedBox(width: 16.0),
                  getButtonTab(registerText, !isSignInToggle)
                ],
              ),
            ),
            SizedBox(
              child: Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10.0),
                child: Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: getCurrentForm(isSignInToggle),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget getCurrentForm(bool isToggled) {
    return (isToggled) ? signInForm() : registerForm();
  }

  Widget getButtonTab(String title, bool isToggled) {
    Widget raisedButton = RaisedButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      textColor: Colors.white,
      color: Colors.green,
      onPressed: () {
        if (!isToggled) {
          toggleContent();
        }
      },
      child: Text(title),
    );
    Widget flatButton = FlatButton(
        onPressed: () {
          if (!isToggled) {
            toggleContent();
          }
        },
        child: Text(title));

    return (isToggled) ? raisedButton : flatButton ;
  }

  toggleContent() {
    setState(() {
      isSignInToggle = !isSignInToggle;
    });
  }

  showSnackBar() {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('Tap'),
    ));
  }

  Widget registerForm() {
    return Form(
      key: _loginContentKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(4),
              child: Card(
                  elevation: 8,
                  margin: EdgeInsets.all(8),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 20.0),
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          hintText: "Name", border: InputBorder.none),
                    ),
                  ))),
          Padding(
              padding: EdgeInsets.all(4),
              child: Card(
                  elevation: 8,
                  margin: EdgeInsets.all(8),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(fontSize: 20.0),
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          hintText: "Email", border: InputBorder.none),
                    ),
                  ))),
          Padding(
              padding: EdgeInsets.all(4),
              child: Card(
                  elevation: 8,
                  margin: EdgeInsets.all(8),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: TextFormField(
                      style: TextStyle(fontSize: 20.0),
                      obscureText: true,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          hintText: "Password", border: InputBorder.none),
                    ),
                  ))),
          Padding(
            padding: EdgeInsets.all(8),
            child: SizedBox(
              height: 48,
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed("/home");
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                textColor: Colors.white,
                color: Colors.green,
                child: Text(_LoginContentState.registerText),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget signInForm() {
    return Form(
      key: _loginContentKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(4),
              child: Card(
                  elevation: 8,
                  margin: EdgeInsets.all(8),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(fontSize: 20.0),
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          hintText: "Email", border: InputBorder.none),
                    ),
                  ))),
          Padding(
              padding: EdgeInsets.all(4),
              child: Card(
                  elevation: 8,
                  margin: EdgeInsets.all(8),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: TextFormField(
                      style: TextStyle(fontSize: 20.0),
                      obscureText: true,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          hintText: "Password", border: InputBorder.none),
                    ),
                  ))),
          Padding(
            padding: EdgeInsets.all(8),
            child: SizedBox(
              height: 48,
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed("/home");
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                textColor: Colors.white,
                color: Colors.green,
                child: Text(_LoginContentState.signInText),
              ),
            ),
          )
        ],
      ),
    );
  }
}
