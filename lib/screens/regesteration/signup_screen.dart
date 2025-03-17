import 'package:flutter/material.dart';
import 'package:quran_app/screens/main_screen.dart';
import 'package:quran_app/screens/regesteration/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool passwordIsObscure = true;
  bool confirmIsObscure = true;

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
                  "Sign Up",
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
                  ),
                  hintText: 'enter your email',
                ),
              ),
              TextFormField(
                controller: passwordController,
                obscureText: passwordIsObscure,
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
                  hintText: 'enter your password',
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          passwordIsObscure == true
                              ? passwordIsObscure = false
                              : passwordIsObscure = true;
                        });
                      },
                      icon: passwordIsObscure == false
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility)),
                ),
              ),
              TextFormField(
                controller: confirmPasswordController,
                obscureText: confirmIsObscure,
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
                  hintText: 'confirm your password',
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          confirmIsObscure == true
                              ? confirmIsObscure = false
                              : confirmIsObscure = true;
                        });
                      },
                      icon: confirmIsObscure == false
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
                    'Sign Up',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an Account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ));
                      },
                      child: Text(
                        'LogIn',
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
