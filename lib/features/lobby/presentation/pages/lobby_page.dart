import 'package:flutter/material.dart';

class LobbyPage extends StatelessWidget {
  const LobbyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              LobbyButton(title: 'Become blue master', onPressed: () {}),
              LobbyButton(title: 'Become red master', onPressed: () {}),
            ],
          ),
          Row(
            children: [
              LobbyButton(title: 'Join blue', onPressed: () {}),
              LobbyButton(title: 'Join red', onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}

class LobbyButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  const LobbyButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
