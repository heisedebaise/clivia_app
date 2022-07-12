import 'package:clivia_base/main.dart';
import 'package:clivia_base/notifier.dart';
import 'package:clivia_user/lockscreen.dart';
import 'package:clivia_user/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'me/main.dart';

void main() async {
  await init(['en', 'zh'], ['l10n/base', 'l10n/user', 'l10n'], () => 'http://localhost:8080');
  User.sign();
  runApp(const Main(title: 'title', home: MainPage()));
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends MainState<MainPage> {
  Widget? me;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ScreenLocker.show(context);
    });
    super.initState();
  }

  @override
  Widget body() {
    switch (context.watch<Notifier>().navigation) {
      case 1:
        return Center(
          child: Column(
            children: const [
              Text('power by clivia-mobile'),
              Text('https://github.com/heisedebaise/clivia-mobile'),
            ],
            mainAxisSize: MainAxisSize.min,
          ),
        );
      case 2:
        me ??= const MePage();
        return me!;
      default:
        return const Center(
          child: Text('coming soon'),
        );
    }
  }

  @override
  List<IconData> icons() => [Icons.home_outlined, Icons.copyright, Icons.person_outline];

  @override
  List<String> labels() => ['home', 'Clivia', 'me'];

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) ScreenLocker.show(context);
    super.didChangeAppLifecycleState(state);
  }
}
