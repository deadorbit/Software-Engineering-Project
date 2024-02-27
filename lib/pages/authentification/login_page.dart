import 'package:flutter/material.dart';
import 'package:software_engineering_project/components/background_container.dart';
import 'package:software_engineering_project/main.dart';
import 'package:google_fonts/google_fonts.dart';
import '';

void main() {
  runApp(const MyApp());
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

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
                              "Login",
                              style: GoogleFonts.bodoniModa(
                                fontSize: 24,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                                height:
                                    30), // Add spacing between text and fields
                            LoginForm(
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
