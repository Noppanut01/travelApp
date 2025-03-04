import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mytravel/screens/sign_in_screen.dart';
import '../widgets/my_button.dart';
import '../widgets/my_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({
    super.key,
  });
  final nameCrontroller = TextEditingController();
  final emailCrontroller = TextEditingController();
  final passwordCrontroller = TextEditingController();
  final rePasswordCrontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    signUp() async {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailCrontroller.text,
          password: passwordCrontroller.text,
        );
        if (emailCrontroller.text.isNotEmpty &&
            passwordCrontroller.text.isNotEmpty &&
            rePasswordCrontroller.text == passwordCrontroller.text) {
          Navigator.push(
            // ignore: use_build_context_synchronously
            context,
            MaterialPageRoute(
              builder: (context) => SignInScreen(),
            ),
          );
          debugPrint("Sign up successful");
        } else {
          debugPrint("Sign up failed");
        }
      } on FirebaseAuthException catch (e) {
        debugPrint(e.message);
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
                  "Welcome to our community.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kanit(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                Text(
                  "\nto get started, please provide your information and create an account. \n",
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
                  controller: nameCrontroller,
                  labelName: "Name",
                  hintText: "Enter your name",
                  obs: false,
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
                MyTextField(
                  controller: rePasswordCrontroller,
                  labelName: "Re-Password",
                  hintText: "Re-enter your password",
                  obs: true,
                ),
                SizedBox(
                  height: 30,
                ),
                MyButton(
                  title: "Sign up",
                  onTab: () {
                    signUp();
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Have a member?",
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
                              builder: (context) => SignInScreen()),
                        );
                      },
                      child: Text(
                        "Sign in.",
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
