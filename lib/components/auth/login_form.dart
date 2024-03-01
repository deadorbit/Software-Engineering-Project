// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:software_engineering_project/pages/auth/landing_page.dart';
import 'package:software_engineering_project/components/auth/error_dialog.dart';

class LoginForm extends StatefulWidget {
  final GlobalKey<FormState> formKey; // Pass the form key from the parent page

  const LoginForm({
    super.key,
    required this.formKey,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void signUserIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, '/nav');
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      authError(context, e);
    }
  }

  // ... other methods for handling form input, validation, and submission

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, // Create a GlobalKey for your Form
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email address.';
              } else if (!RegExp(
                      r"^[a-zA-Z0-9.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$")
                  .hasMatch(value)) {
                return 'Please enter a valid email address format.';
              }
              return null; // Input is valid
            },
          ),
          const SizedBox(height: 32),
          TextFormField(
            controller: _passwordController,
            obscureText: true, // Hide password characters
            decoration: const InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password';
              } else if (!RegExp(
                      r"^^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()-])[a-zA-Z0-9!@#$%^&*()-]{8,32}$")
                  .hasMatch(value)) {
                return 'Please enter a valid password.';
              }
              return null; // Input is valid
            },
          ),
          const SizedBox(height: 36),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Space buttons evenly
            children: [
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    signUserIn();
                  }
                },
                child: const Text('Sign In'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      duration: const Duration(milliseconds: 500),
                      child: const LandingPage(), //returns to previous page
                    ),
                  );
                },
                child: const Text("Cancel"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> authError(BuildContext context, FirebaseException error) async {
    print(error.code);
    // Create a user-friendly error message based on the error code
    String errorMessage = "";
    switch (error.code) {
      case "invalid-email":
        errorMessage = "Please enter a valid email address.";
        break;
      case "weak-password":
        errorMessage =
            "Your password is too weak. Please create a stronger password.";
        break;
      case "email-already-in-use":
        errorMessage =
            "The email address is already in use by another account.";
        break;
      case "user-not-found":
        errorMessage = "The email address could not be found.";
        break;
      case "invalid-credential":
        errorMessage = "Invalid email or password combination.";
        break;
      case "too-many-requests":
        errorMessage =
            "Too many requests have been made to the server. Please try again later.";
        break;
      default:
        errorMessage =
            "An error occurred during authentication. Please try again later.";
    }

    //Create Alert Dialog
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => ErrorDialog(errorMessage: errorMessage),
    );
  }
}
