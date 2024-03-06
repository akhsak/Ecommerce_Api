// ignore_for_file: prefer_final_fields, prefer_const_constructors, no_leading_underscores_for_local_identifiers, must_be_immutable, use_build_context_synchronously, prefer_const_declarations

import 'package:ecommerce_app/welcome/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ScreenLogin extends StatelessWidget {
  ScreenLogin({Key? key}) : super(key: key);

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isDataMatched = true;
  final _formKey = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(  
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.asset(
                      'assets/Investment data-rafiki.png', 
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                       
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              hintText: 'Username',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter username';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              hintText: 'Password',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        Visibility(
                          visible: !_isDataMatched,
                          child: Text(
                            'Username password does not match',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        
                        ElevatedButton.icon(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              checkLogin(context);
                            } else {
                            }
                          },
                          icon:
                           Icon(Icons.login),
                          label: Text('Login'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future checkLogin(BuildContext ctx) async {
    final username = _usernameController.text;
    final password = _passwordController.text;
    if (username == password) {
      final _srdprf = await SharedPreferences.getInstance();
      await _srdprf.setBool('your_actual_key_name_here', true);


      Navigator.of(ctx).pushReplacement(
        MaterialPageRoute(builder: (ctx) => SplashScreen()),
      );
    } else {

      final _errorMessage = 'Username password does not match';

      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          margin: EdgeInsets.all(10),
          content: Text(_errorMessage),
          duration: Duration(seconds: 5),
        ),
      );
    }
  }
}
