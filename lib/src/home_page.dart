import 'package:codenames_client/common/app_text_style.dart';
import 'package:codenames_client/core/models/report.dart';
import 'package:codenames_client/core/models/user.dart';
import 'package:codenames_client/src/dialogs/create_report.dart';
import 'package:codenames_client/src/dialogs/user_dialog.dart';
import 'package:codenames_client/src/real_page.dart';
import 'package:codenames_client/src/report/report_store.dart';
import 'package:codenames_client/src/user/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reportsStore = Provider.of<ReportStore>(context);
    final userStore = Provider.of<UserStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Сервис отзывов'),
        actions: const [
          UserButton(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showDialog(
          context: context,
          builder: (_) => CreateDialog(),
        ),
      ),
      body: Observer(
        builder: (context) {
          if (userStore.status == Status.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          switch (reportsStore.status) {
            case Status.initial:
            case Status.loading:
              print(FutureStatus.pending);
              return const Center(
                child: CircularProgressIndicator(),
              );

            // case Status.loading:
            //   print(FutureStatus.rejected);
            //   return Center(
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: <Widget>[
            //         const Text(
            //           'Failed to load items.',
            //           style: TextStyle(color: Colors.red),
            //         ),
            //         const SizedBox(
            //           height: 10,
            //         ),
            //         ElevatedButton(
            //           child: const Text('Tap to retry'),
            //           onPressed: () => reportsStore.fetchReports(),
            //         )
            //       ],
            //     ),
            //   );

            case Status.loaded:
              print(FutureStatus.fulfilled);

              return RealPage(reports: reportsStore.reportList);

            default:
              return const Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }
}

class UserButton extends StatelessWidget {
  const UserButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context);

    return Observer(
      builder: (context) {
        final user = userStore.user;
        return user == null
            ? TextButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => UserDialog(),
                  );
                },
                child: const Text('Войти'),
              )
            : Center(
                child: Padding(
                  child: Text(
                    user.login,
                    style: AppTextStyles.subtitle,
                  ),
                  padding: const EdgeInsets.only(right: 16),
                ),
              );
      },
    );
  }
}
