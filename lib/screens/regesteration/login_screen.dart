import 'package:flutter/material.dart';
import 'package:quran_app/screens/main_screen.dart';
import 'package:quran_app/screens/regesteration/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 10,
            children: [
              SizedBox(height: 50),
              Image.asset(
                'assets/login_img.png',
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: const Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Colors.green[200],
                    label: Text(
                      'E-Mail',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                    )),
              ),
              TextFormField(
                controller: passwordController,
                obscureText: isObscure,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Colors.green[200],
                  label: Text(
                    'Password',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isObscure == true
                              ? isObscure = false
                              : isObscure = true;
                        });
                      },
                      icon: isObscure == false
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * .80, 50),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an Account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupScreen(),
                            ));
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.blue.shade700),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
