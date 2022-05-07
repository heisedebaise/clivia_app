import 'package:clivia_base/main.dart';
import 'package:clivia_user/generated/l10n.dart' as userl10n;
import 'package:clivia_user/me/lockscreen.dart';
import 'package:clivia_user/me/main.dart';
import 'package:clivia_user/user.dart';
import 'package:flutter/material.dart';

import 'generated/l10n.dart';

void main() async {
  await init(() => 'http://localhost:8080');
  User.sign();
  runApp(const Main(title: 'Clivia', home: MainPage(), delegates: [userl10n.S.delegate, S.delegate]));
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends MainState<MainPage> {
  Widget? me;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      ScreenLocker.show(context);
    });
  }

  @override
  Widget body() {
    switch (navigation) {
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
  List<String> labels() => [S.of(context).home, 'Clivia', S.of(context).me];

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) ScreenLocker.show(context);
    super.didChangeAppLifecycleState(state);
  }
}
