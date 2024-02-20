import 'package:flutter/material.dart';
import 'package:software_engineering_project/components/background_container.dart';
import 'package:software_engineering_project/components/registration_form.dart';
import 'package:software_engineering_project/main.dart';
import 'package:google_fonts/google_fonts.dart';
<<<<<<< Updated upstream:lib/pages/register_page.dart
import 'package:software_engineering_project/pages/landing_page.dart';
import 'package:software_engineering_project/pages/profile_page.dart';
=======
>>>>>>> Stashed changes:lib/Pages/authentification/register_page.dart

void main() {
  runApp(const MyApp());
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
<<<<<<< Updated upstream:lib/pages/register_page.dart
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void signUserUp() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      if (_passwordController.text == _confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
      } else {
        wrongEmailMessage();
      }
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, '/profile');
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      //Wrong Email
      if (e.code == 'invalid-credential') {
        wrongEmailMessage();
      }
    }
  }

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text("Error handling information"),
        );
      },
    );
  }
=======
  final _formKey = GlobalKey<FormState>();
>>>>>>> Stashed changes:lib/Pages/authentification/register_page.dart

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundContainer(),
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(60.0),
                child: Column(
                  children: [
                    Container(
                      // Transparent background container
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(
                            30.0), // Adjust padding as needed
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "TradeWise",
                              style: GoogleFonts.bodoniModa(
                                color: const Color.fromARGB(255, 59, 59, 61),
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "Registration",
                              style: GoogleFonts.bodoniModa(
                                fontSize: 24,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                                height:
                                    30), // Add spacing between text and fields
                            // ... your password fields and form content
                            RegistrationForm(
                              formKey:
                                  _formKey, // Pass the signUserUp function here
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
