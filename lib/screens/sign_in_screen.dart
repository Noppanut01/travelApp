import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mytravel/screens/home_screen.dart';
import 'package:mytravel/screens/sign_up_screen.dart';
import '../widgets/my_button.dart';
import '../widgets/my_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({
    super.key,
  });
  final emailCrontroller = TextEditingController();
  final passwordCrontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isSignIn = false;

    signIn() async {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailCrontroller.text,
          password: passwordCrontroller.text,
        );
        isSignIn = true;
        if (isSignIn) {
          Navigator.push(
            // ignore: use_build_context_synchronously
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
        }
        isSignIn = false;
        debugPrint("Sign in successful");
      } on FirebaseAuthException catch (e) {
        debugPrint(e.message);
        isSignIn = false;
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
        child: Form(
          child: SafeArea(
            child: Column(
              children: [
                Text(
                  "Hello, ready to get started",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kanit(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                Text(
                  "\nplease, sign in with your email and password\n",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kanit(
                    textStyle: Theme.of(context).textTheme.displaySmall,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MyTextField(
                  controller: emailCrontroller,
                  labelName: "Email",
                  hintText: "Enter your email",
                  obs: false,
                ),
                SizedBox(
                  height: 20,
                ),
                MyTextField(
                  controller: passwordCrontroller,
                  labelName: "Password",
                  hintText: "Enter your password",
                  obs: true,
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot password?",
                    style: GoogleFonts.kanit(
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                      fontWeight: FontWeight.normal,
                      color: Colors.blue,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                MyButton(
                  title: "Sign in",
                  onTab: () {
                    signIn();
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member?",
                      style: GoogleFonts.kanit(
                        textStyle: Theme.of(context).textTheme.bodyLarge,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Register now.",
                        style: GoogleFonts.kanit(
                          textStyle: Theme.of(context).textTheme.bodyLarge,
                          fontWeight: FontWeight.normal,
                          color: Colors.blue,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
