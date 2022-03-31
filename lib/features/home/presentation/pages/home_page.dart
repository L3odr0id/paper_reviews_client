import 'package:codenames_client/common/navigation_paths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('eh');
    return Scaffold(
      body: Column(
        children: [
          CreateRoomButton(),
          EnterRoom(),
        ],
      ),
    );
  }
}

class CreateRoomButton extends StatelessWidget {
  const CreateRoomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // final int a = Get.find();
        // Navigator.pushNamed(context, NavigationPaths.lobbyPath);
      },
      child: Text(
        'Создать комнату',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}

class EnterRoom extends StatelessWidget {
  EnterRoom({Key? key}) : super(key: key);

  final controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: formKey,
          child: TextFormField(),
        ),
        ElevatedButton(
          onPressed: () {
            final int a = Get.find();
            // Navigator.pushNamed(context, NavigationPaths.lobbyPath);
          },
          child: Text(
            'Войти',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
