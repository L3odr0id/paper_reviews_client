import 'dart:developer';

import 'package:codenames_client/common/app_text_style.dart';
import 'package:codenames_client/src/user/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class UserDialog extends StatelessWidget {
  UserDialog({Key? key}) : super(key: key);

  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context);
    final future = userStore.user;

    return Dialog(
      backgroundColor: Colors.white,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 720,
        ),
        child: Observer(
          builder: (context) {
            if (future.status == FutureStatus.fulfilled) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 24),
                  const Text(
                    'Авторизация',
                    style: AppTextStyles.subtitle,
                  ),
                  const SizedBox(height: 16),
                  buildField(loginController, 'Логин'),
                  buildField(passwordController, 'Пароль'),
                  const SizedBox(height: 16),
                  _Submit(
                    loginController: loginController,
                    passwordController: passwordController,
                  ),
                  const SizedBox(height: 24),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class _Submit extends StatefulWidget {
  const _Submit({
    required this.loginController,
    required this.passwordController,
  });

  final TextEditingController loginController;
  final TextEditingController passwordController;

  @override
  State<StatefulWidget> createState() => _SubmitState();
}

class _SubmitState extends State<_Submit> {
  bool isSignIn = true;

  String get title => isSignIn ? 'Войти' : 'Зарегистрироваться';
  String get toggleButton => isSignIn ? 'Создать аккаунт' : 'Уже есть аккаунт?';

  Future<void> signIn(BuildContext context) async {
    log('yes');
    final userStore = Provider.of<UserStore>(context, listen: false);
    await userStore.getUser(
      widget.loginController.text,
      widget.passwordController.text,
    );
    Navigator.pop(context);
  }

  Future<void> signUp(BuildContext context) async {
    final userStore = Provider.of<UserStore>(context, listen: false);
    await userStore.postUser(
      widget.loginController.text,
      widget.passwordController.text,
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => isSignIn ? signIn(context) : signUp(context),
          child: Text(title),
        ),
        SizedBox(height: 16),
        TextButton(
          child: Text(toggleButton),
          onPressed: () {
            setState(() {
              isSignIn = !isSignIn;
            });
          },
        ),
      ],
    );
  }
}

Widget buildField(TextEditingController controller, String hint,
    [bool onlyInt = false]) {
  return Padding(
    padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
    child: Container(
      constraints: const BoxConstraints(maxWidth: 420),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value != null) {
            if (value.isEmpty) {
              return 'Поле не может быть пустым';
            }
            if (onlyInt && int.tryParse(value) == null) {
              return 'Должно быть целым числом';
            }
          }
        },
        decoration: InputDecoration(hintText: hint),
      ),
    ),
  );
}

class _SignIn extends StatelessWidget {
  const _SignIn({required this.toggle});

  final void Function() toggle;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(''),
        ],
      ),
    );
  }
}

class _Registration extends StatelessWidget {
  const _Registration({required this.toggle});

  final void Function() toggle;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(''),
        ],
      ),
    );
  }
}
