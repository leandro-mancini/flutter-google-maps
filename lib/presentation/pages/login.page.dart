import 'package:abastecimento/presentation/pages/postos.page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        heightFactor: double.infinity,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: 30,
            bottom: 30,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 60,
                  height: 60,
                  child: Image.asset('assets/ic_launcher.png'),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 48,
                  padding: EdgeInsets.only(
                    left: 30,
                    right: 30
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF6200EE),
                          width: 2,
                        )
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Login',
                      labelStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      )
                    ),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 48,
                  padding: EdgeInsets.only(
                    left: 30,
                    right: 30
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: _passwordVisible,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF6200EE),
                          width: 2,
                        )
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Senha',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                          color: Colors.black38,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;  
                          });
                        },
                      ),
                      labelStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      )
                    ),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                          left: 20
                        ),
                        child: FlatButton(
                          child: Text(
                            'Esqueceu a senha?',
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 14,
                            ),
                          ),
                          onPressed: () => {},
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          right: 30,
                        ),
                        height: 40,
                        child: RaisedButton(
                          color: Color(0xFF6200EE),
                          padding: EdgeInsets.only(
                            left: 30,
                            right: 30,
                          ),
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40)),
                          child: Text(
                            'ENTRAR',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          onPressed: () => {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (context) => PostosPage(),
                              )
                            )
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                          left: 20
                        ),
                        child: FlatButton(
                          child: Text(
                            'Cadastre-se',
                            style: TextStyle(
                              color: Color(0xFF6200EE),
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () => {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ),
      )
    );
  }
}