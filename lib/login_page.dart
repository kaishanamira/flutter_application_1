import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 126, 13, 13)),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = '';
  String password = '';
  bool isLoginSuccess = true;
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/image/logo.png',
                height: 80.0,
              ),
              usernameField(),
              passwordField(),
              loginButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget usernameField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          const SizedBox(height: 8), // Spacing between icon and text field
          TextFormField(
            onChanged: (value) {
              username = value;
            },
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Username',
              labelStyle: const TextStyle(color: Colors.white),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget passwordField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        onChanged: (value) {
          password = value;
        },
        obscureText: visible,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                visible = !visible;
              });
            },
            icon: Icon(visible ? Icons.visibility : Icons.visibility_off,
                color: Colors.white),
          ),
          labelText: 'Password',
          labelStyle: const TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget loginButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          String text = '';
          Color textColor;
          Color backgroundColor;

          if (username == 'kai' && password == 'cake') {
            setState(() {
              text = 'Login Success <3';
              isLoginSuccess = true;
            });
            textColor = const Color.fromARGB(255, 126, 13, 13);
            backgroundColor = Colors.white; // White background for success

            // Navigate to the success page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SuccessPage()),
            );
          } else {
            setState(() {
              text = 'Login Failed! Incorrect username or password </3';
              isLoginSuccess = false;
            });
            textColor = const Color.fromARGB(255, 126, 13, 13);
            backgroundColor = Colors.black; // Black background for failure
          }

          SnackBar snackBar = SnackBar(
            content: Text(
              text,
              style: TextStyle(color: textColor),
            ),
            backgroundColor: backgroundColor,
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Login'),
      ),
    );
  }
}

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Success page'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('assets/image/background2.jpeg'), // Background image
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/image/lana.jpeg', // Image at the top
                    height: 50.0,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Lana Del Rey : Art Deco',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding:
                        const EdgeInsets.all(16.0), // Padding around the text
                    decoration: BoxDecoration(
                      color: Colors.red
                          .withOpacity(0.5), // Transparent red background
                      borderRadius: BorderRadius.circular(
                          8.0), // Optional: rounded corners
                    ),
                    child: Text(
                      '''Prowling around at night
You're not mean, you just want to be seen
Want to be wild
A little party never hurt no one, that's why it's alright
You want in but you just can't win
So you hang in the lights
You're so Art Deco, out on the floor
Shining like gun metal, cold and unsure
Baby, you're so ghetto
You're looking to score
When they all say hello
You try to ignore them
'Cause you want more (why?)
You want more (why?)
You want more (why?)
'Cause you want more
Young thing on the downtown scene
Rolling around at night
Got things that have yet to be seen
Like you're rapper's delight
A little party never hurt no one, that's why it's alright
You want in, but you just can't win
So you stay in the lights
You're so Art Deco, out on the floor
Shining like gun metal, cold and unsure
Baby, you're so ghetto
You're looking to score
When they all say hello
You try to ignore them
'Cause you want more (why?)
You want more (why?)
You want more (why?)
'Cause you want more''',
                      style: TextStyle(
                          fontSize: 12,
                          color: const Color.fromARGB(255, 255, 255, 255)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
