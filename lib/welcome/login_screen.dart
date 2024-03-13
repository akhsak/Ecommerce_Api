import 'dart:developer';
import 'package:ecommerce_app/controller/store_provider.dart';
import 'package:ecommerce_app/controller/user_provider.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:ecommerce_app/welcome/sign_up_page.dart';
import 'package:ecommerce_app/widget/bottom_bar.dart';
import 'package:ecommerce_app/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
                child: Image.asset('assets/babys_login.png.png',
                    width: mediaQuery.width * 0.7,
                    height: mediaQuery.height * 0.4)),
            Expanded(
                child: Container(
              height: mediaQuery.height * 0.3,
              width: mediaQuery.width * 0.5,
              padding: const EdgeInsets.only(bottom: 35),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Card(
                  elevation: 5,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Text(
                            'LOGIN',
                            style: GoogleFonts.abel(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color.fromARGB(255, 199, 51, 142),
                                letterSpacing: 5),
                          ),
                          const SizedBox(height: 10),
                          CustomTextFormField(
                            controller: userProvider.usernameController,
                            labelText: 'enter username',
                          ),
                          const SizedBox(height: 10),
                          CustomTextFormField(
                            controller: userProvider.passwordController,
                            labelText: 'enter password',
                            obscureText: true,
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 199, 51, 142),
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  userLogin(context);
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => BottomBar()));
                                }
                              },
                              child: const Text(
                                'LOGIN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800),
                              )),
                          const SizedBox(height: 15),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Don't have an account ?",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen()));
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(color:Color.fromARGB(255, 199, 51, 142)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  userLogin(context) async {
    final getUserProvider = Provider.of<UserProvider>(context, listen: false);
    final getStoreProvider = Provider.of<StoreProvider>(context, listen: false);
    final userInfo = UserModel(
      username: getUserProvider.usernameController.text.toString(),
      password: getUserProvider.passwordController.text.toString(),
    );

    try {
      await getUserProvider.userLogin(userInfo);
      final tokenId = await getStoreProvider.getValues('tokenId');
      if (getUserProvider.userStatusCode == "200" &&
          tokenId?.isNotEmpty == true) {
        await getUserProvider.setUserData();
        clearController(getUserProvider);

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Bottombar()));
      } else if (getUserProvider.userStatusCode == '500') {}
    } catch (e) {
      log('Error during user login: $e');
    }
  }
    clearController(UserProvider controller){
    controller.usernameController.clear();
    controller.emailController.clear();
    controller.passwordController.clear();
  }
}