import 'package:ecommerce_app/welcome/login_screen.dart';
import 'package:ecommerce_app/widget/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: Column(
        children: <Widget>[
          Expanded(
              child: Lottie.asset('assets/Animation - 1709715590668 (1).json',
                  fit: BoxFit.cover)),
          Expanded(
              child: Column(
            children: <Widget>[
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: ' Baby product',
                    style: GoogleFonts.aBeeZee(
                        color: Color.fromARGB(255, 199, 51, 142),
                        letterSpacing: .5,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
                const WidgetSpan(
                  child: SizedBox(height: 10),
                ),
                TextSpan(
                    text: 'babyss...',
                    style: GoogleFonts.abel(color: Colors.white, fontSize: 17))
              ])),
              const SizedBox(height: 60),
              SizedBox(
                height: mediaQuery.height * 0.1,
                width: mediaQuery.width * 0.8,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  Color.fromARGB(255, 199, 51, 142),
                    ),
                    onPressed: () {
                      checkUserLoggedIn(context);
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'GET STARTED',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.arrow_forward,
                          color:  Colors.white,
                        )
                      ],
                    )),
              )
            ],
          ))
        ],
      ),
    ));
  }

  checkUserLoggedIn(context) async {
    final sharedPrfs = await SharedPreferences.getInstance();
    final userLoggedIn = sharedPrfs.getBool('savekey');
    if (userLoggedIn == null || userLoggedIn == false) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Bottombar(),
      ));
    }
  }
}