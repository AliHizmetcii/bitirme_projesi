import 'package:bitirme_projesi/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Login());
}

class Login extends StatefulWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

   Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  get usernameController => null;
  get passwordController => null;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Giriş Yap")),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                child: Theme(
                  data: ThemeData(
                    primaryColor: Colors.redAccent,
                    primaryColorDark: Colors.red,
                  ),
                  child: TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                      hintText: 'Kullanıcı Adı',
                      labelText: 'Kullanıcı Adı',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                child: Theme(
                  data: ThemeData(
                    primaryColor: Colors.redAccent,
                    primaryColorDark: Colors.red,
                  ),
                  child: TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                      hintText: 'Şifre',
                      labelText: 'Şifre',
                      prefixIcon: Icon(
                        Icons.password,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.green,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
                      tooltip: 'Giriş Yap',
                      onPressed: () async {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyApp()),
                          );
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 25),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
