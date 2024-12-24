import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_appp/home_page.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernamecontroller = TextEditingController();
  final  TextEditingController passwordcontroller = TextEditingController();
    final username = usernamecontroller.text;
  final password = passwordcontroller.text;
   Future<void> singnup()async{
      if(username.isNotEmpty && password.isNotEmpty){
        var response = await http.post(Uri.parse("https://interview-mock-api.onrender.com/login"),
        body: ({
          'username':username,
          'password': password,
        })
        );
         if (response.statusCode == 200) 
         {
    print("Correct");
    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
  } else {
    print("Signin Error");
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Invalid credentials")));
  }
} else {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text("Blank field is not allowed")));
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: usernamecontroller,
            decoration: const InputDecoration(
              hintText: 'Username',
            ),
          ),
          TextField(
            controller: passwordcontroller,
            decoration: const InputDecoration(
              hintText: 'Password',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              print('Username: ${usernamecontroller.text}');
              print('Password: ${passwordcontroller.text}');
            },
            child: const Text('Sign Up'),
          ),
        ],
      ),
      
    );
  }
}