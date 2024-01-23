import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pico_agent/features/auth/application/auth_serviece.dart';
import 'package:pico_agent/features/auth/presentation/add_hospital_information.dart';
import 'package:pico_agent/model/hospital_model.dart';
import '../../../../app_route.dart';

// import 'package:pico_agent/features/home/presentation/home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  AuthService _authService = AuthService();

  bool isDone = false;

  // void login() async {
  //   String uid = "";
  //   try {
  //     final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: _userNameController.text,
  //       password: _passwordController.text,
  //     );
  //     print("Credeintal $credential");

  //     isDone = true;
  //     // uId = credential.user! as UserCredential;

  //     // print(uId);
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       print('No user found for that email.');
  //     } else if (e.code == 'wrong-password') {
  //       print('Wrong password provided for that user.');
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.teal, // Set the background color to teal
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/logo.png', // Replace with the path to your logo image
                        height: 100,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: _userNameController,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          // ignore: unrelated_type_equality_checks

                        final bool isC = await AuthService.login(userNameController: _userNameController.value.text, passwordController: _passwordController.value.text);
                        final hospitalModel = await AuthService.getHospitaldata();
                        isC == true ? hospitalModel != null ? context.go(AppRoute.home) : Navigator.push(context, MaterialPageRoute(builder: (_)=> AddHospitalInformation())): null;
                        

                          
                        },
                        child: Text('Login'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
