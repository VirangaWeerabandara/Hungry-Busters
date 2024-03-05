import 'package:assignment2/navigationBar.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: FractionallySizedBox(
          widthFactor: 1,
          heightFactor: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: screenHeight * 0.2,
                child: const Image(
                  image: AssetImage('assets/images/logo2.png'),
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              TextFormField(
                controller: _usernameController,
                cursorColor: const Color.fromRGBO(238, 81, 81, 1),
                style: const TextStyle(color: Colors.grey),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(top: -5),
                  labelText: 'Email',
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(238, 81, 81, 1))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(238, 81, 81, 1))),
                  labelStyle: TextStyle(
                      fontSize: 17, color: Color.fromRGBO(238, 81, 81, 1)),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              TextFormField(
                obscureText: true,
                controller: _passwordController,
                cursorColor: const Color.fromRGBO(238, 81, 81, 1),
                style: const TextStyle(color: Colors.grey),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(top: -5),
                  labelText: 'Password',
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(238, 81, 81, 1))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(238, 81, 81, 1))),
                  labelStyle: TextStyle(
                      fontSize: 17, color: Color.fromRGBO(238, 81, 81, 1)),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.005,
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  )),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.07,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromRGBO(238, 81, 81, 1)),
                child: TextButton(
                    onPressed: () {
                      if (_usernameController.text == 'admin' &&
                          _passwordController.text == 'admin') {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const Navigationbar(),
                        ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Invalid Credentials')));
                      }
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ),
              SizedBox(
                height: screenHeight * 0.005,
              ),
              const Text(
                'or',
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(image: AssetImage('assets/icons/google.png')),
                  SizedBox(
                    width: screenWidth * 0.1,
                  ),
                  const Image(image: AssetImage('assets/icons/facebook.png')),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Don\'t have an account? Sign Up',
                    style: TextStyle(
                      color: Color.fromRGBO(238, 81, 81, 1),
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                      decorationColor: Color.fromRGBO(238, 81, 81, 1),
                    ),
                  ),
                ),
              ),
            ],
          )),
    ));
  }
}
