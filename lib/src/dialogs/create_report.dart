import 'dart:developer';

import 'package:codenames_client/common/app_text_style.dart';
import 'package:codenames_client/core/models/report.dart';
import 'package:codenames_client/core/models/user.dart';
import 'package:codenames_client/src/report/report_store.dart';
import 'package:codenames_client/src/user/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class CreateDialog extends StatelessWidget {
  CreateDialog({Key? key}) : super(key: key);

  final TextEditingController titleContorller = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();

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
                    'Создать отзыв',
                    style: AppTextStyles.subtitle,
                  ),
                  const SizedBox(height: 16),
                  buildField(subjectController, 'Тема'),
                  buildField(titleContorller, 'Заголовок'),
                  buildField(messageController, 'Основной текст', false, 5),
                  const SizedBox(height: 16),
                  _Submit(
                    subjectController: subjectController,
                    titleContorller: titleContorller,
                    messageController: messageController,
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

class _Submit extends StatelessWidget {
  const _Submit({
    required this.titleContorller,
    required this.messageController,
    required this.subjectController,
  });

  final TextEditingController titleContorller;
  final TextEditingController messageController;
  final TextEditingController subjectController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final createReport = Provider.of<ReportStore>(context, listen: false);
        final userFuture = Provider.of<UserStore>(context, listen: false).user;
        if (userFuture.status == FutureStatus.fulfilled &&
            userFuture.result != null) {
          final user = userFuture.result as User;
          await createReport.postReports(
            Report(
              author: user.login,
              date: DateTime.now(),
              message: messageController.text,
              subject: subjectController.text,
              title: titleContorller.text,
              id: '-1',
              isAnonymous: false,
            ),
          );
        } else {
          await createReport.postReports(
            Report(
              author: 'Anonymous',
              date: DateTime.now(),
              message: messageController.text,
              subject: subjectController.text,
              title: titleContorller.text,
              id: '-1',
              isAnonymous: true,
            ),
          );
        }
        Navigator.pop(context);
      },
      child: Text('Отправить отзыв'),
    );
  }
}

Widget buildField(TextEditingController controller, String hint,
    [bool onlyInt = false, int maxLines = 1]) {
  return Padding(
    padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
    child: Container(
      constraints: const BoxConstraints(maxWidth: 420),
      child: TextFormField(
        maxLines: maxLines,
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
