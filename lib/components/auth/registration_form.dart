import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:software_engineering_project/Pages/auth/landing_page.dart';
import 'package:software_engineering_project/components/auth/error_dialog.dart';
import 'package:software_engineering_project/components/auth/passwordfield.dart';
import 'package:software_engineering_project/models/user_model.dart';

class RegistrationForm extends StatefulWidget {
  final GlobalKey<FormState> formKey; // Pass the form key from the parent page

  const RegistrationForm({
    super.key,
    required this.formKey,
  });

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  void signUserUp() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
      createUserData();
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, '/nav');
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      authError(context, e);
    }
  }

  void createUserData() async{
    final User? user = auth.currentUser;
    final usersCollection = firestore.collection('Users');
    String uid = "";
    String email = "";
    String? name = _usernameController.text;

    if (user != null) {
      uid = user.uid;
      email = user.email!; // Assuming email is not null

      UserModel userData = UserModel(
        uid: uid,
        name: name,
        email: email, 
      );
      userData.createUser(usersCollection);
    } 

    Navigator.pop(context);// end loading icon
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
          const SizedBox(height: 16),
          TextFormField(
            controller: _usernameController,
            decoration: const InputDecoration(
              labelText: 'Username',
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 16),
          PasswordField(controller: _passwordController),
          const SizedBox(height: 16),
          TextFormField(
            controller: _confirmPasswordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Confirm Password',
              prefixIcon: Icon(Icons.lock),
            ),
            validator: (value) {
              if (value != _passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Space buttons evenly
            children: [
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    signUserUp();
                  }
                },
                child: const Text('Sign Up'),
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
        errorMessage = "Your password is too weak. Please create a stronger password.";
        break;
      case "email-already-in-use":
        errorMessage = "The email address is already in use by another account.";
        break;
      case "user-not-found":
        errorMessage = "The email address could not be found.";
        break;
      case "invalid-credential":
        errorMessage = "Invalid email or password combination.";
        break;
      case "too-many-requests":
        errorMessage = "Too many requests have been made to the server. Please try again later.";
        break;
      default:
        errorMessage = "An error occurred during authentication. Please try again later.";
    }

    //Create Alert Dialog using error message
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => ErrorDialog(errorMessage: errorMessage),
    );
  }
}
