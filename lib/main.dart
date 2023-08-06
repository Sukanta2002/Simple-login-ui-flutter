import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  bool isEmailOk = false;
  bool isPasswordOk = false;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/app_logo-removebg-preview.png"),
            const Text(
              'Login',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 40,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('E-Mail'),
                TextField(
                  controller: _emailController,
                  onChanged: (value) {
                    if (_emailController.text.isNotEmpty &&
                        _emailController.text.contains('@') &&
                        _emailController.text.contains('.')) {
                      setState(() {
                        isEmailOk = true;
                      });
                    } else {
                      setState(() {
                        isEmailOk = false;
                      });
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: 'yourname@gmail.com',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Password'),
                TextField(
                  onChanged: (value) {
                    if (_passwordController.text.isNotEmpty &&
                        _passwordController.text.length == 8 &&
                        _passwordController.text.contains(RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'))) {
                      setState(() {
                        isPasswordOk = true;
                      });
                    } else {
                      setState(() {
                        isPasswordOk = false;
                      });
                    }
                  },
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Yourpassword',
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: isPasswordOk && isEmailOk ? () {} : null,
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Don't have an account yet?"),
                  TextButton(
                    onPressed: null,
                    child: Text(
                      'Sign up',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
