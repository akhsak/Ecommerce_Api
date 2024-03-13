

import 'package:ecommerce_app/controller/user_provider.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:ecommerce_app/welcome/login_screen.dart';
import 'package:ecommerce_app/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  
  final formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final getProvider = Provider.of<UserProvider>(context, listen: false);
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color:Color.fromARGB(255, 199, 51, 142),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          
            Expanded(
              child: Container(
                height: mediaQuery.height * 0.65,
                width: mediaQuery.width * 0.7,
                padding: const EdgeInsets.only(bottom: 35),
                child: Card(
                  elevation: 5,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 35, horizontal: 15),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Form(
                        key: formKey2,
                        child: Column(
                          children: [
                            Text(
                              'Sign Up',
                              style: GoogleFonts.abel(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color.fromARGB(255, 199, 51, 142),
                                letterSpacing: 5,
                              ),
                            ),
                            const SizedBox(height: 10),
                          
                             CustomTextFormField(
                              controller: getProvider. usernameController,
                              labelText: 'Username',
                            ),
                            const SizedBox(height: 10),
                            CustomTextFormField(
                              controller: getProvider.emailController,
                              labelText: 'E-mail',
                              type: 'Email',
                            ),
                            const SizedBox(height: 10),
                           
                            const SizedBox(height: 10),
                            CustomTextFormField(
                              controller:getProvider. passwordController,
                              labelText: 'Password',
                              type: 'Password',
                              obscureText: true,
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:Color.fromARGB(255, 199, 51, 142),
                              ),
                              onPressed: () async {
                                if (formKey2.currentState!.validate()) {
                                  await createUser(context);
                                }
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  createUser(context) async {
    final getProvider = Provider.of<UserProvider>(context, listen: false);
    final userInfo = UserModel(
   //  name: getProvider.nameController.text.toString(),
      email: getProvider.emailController.text.toString(),
      username: getProvider.usernameController.text.toString(),
      password: getProvider.passwordController.text.toString(),
    );
    await getProvider.createUser(userInfo);
    if (getProvider.createdStatusCode == "201") {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
      clearController(getProvider);
    } else {}
  }
      clearController(UserProvider controller){
    controller.usernameController.clear();
    controller.emailController.clear();
    controller.passwordController.clear();
  }
}
