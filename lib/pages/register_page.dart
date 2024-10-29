import 'package:flutter/material.dart';
import 'package:papa_gusto_app/components/my_button.dart';
import 'package:papa_gusto_app/components/my_textfield.dart';
import 'package:papa_gusto_app/services/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  //registter method
  void register() async {
    //get auth service
    final _authService = AuthService();

    //check if passwords math -> create user
    if (passwordController.text == confirmPasswordController.text) {
      //try creating user
      try {
        await _authService.signUpWithEmailPassword(
          emailController.text,
          passwordController.text,
        );
      }

      //display any errors
      catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              e.toString(),
            ),
          ),
        );
      }
    }

    //if passwords dont match -> show error
    else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text('Пароли не совпадают!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            // Image(image: AssetImage('assets/logo.png')),
            Icon(Icons.lock_open_rounded,
                size: 100, color: Theme.of(context).colorScheme.inversePrimary),

            const SizedBox(
              height: 25,
            ),

            //message, app slogan
            Text(
              "Создайте аккаунт",
              style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),

            const SizedBox(
              height: 25,
            ),

            //email text field
            MyTextField(
              controller: emailController,
              hintText: "Email",
              obscureText: false,
            ),

            const SizedBox(
              height: 10,
            ),

            //password textfield
            MyTextField(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ),

            const SizedBox(
              height: 10,
            ),

            MyTextField(
              controller: confirmPasswordController,
              hintText: "Confirm psssword",
              obscureText: true,
            ),

            const SizedBox(
              height: 25,
            ),

            //sign in button
            MyButton(
              text: 'Зарегестрироваться',
              onTap: () {
                register();
              },
            ),

            const SizedBox(
              height: 25,
            ),

            //already have an account? login here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Уже есть аккаунт?',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text('Войти сейчас',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
