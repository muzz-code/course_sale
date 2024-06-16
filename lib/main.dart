import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_styles.dart';
import 'package:ulearning_app/splash.dart';

import 'common/routes/router.dart';
import 'global/global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp(
              initialRoute: SplashScreens.routeName,
              title: 'Flutter Demo',
              theme: AppTheme.appThemeData,
              onGenerateRoute: Routers.generateRoute,
            ));
  }
}

final appCount = StateProvider<int>((ref) {
  return 3;
});

class MyHomePage extends ConsumerWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int count = ref.watch(appCount);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Riverpod app"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              count.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: "one",
            onPressed: () => navRoute(),
            tooltip: 'Increment',
            child: const Icon(Icons.arrow_right_rounded),
          ),
          const FloatingActionButton(
            heroTag: "one",
            onPressed: myTap,
            tooltip: 'Increment',
            child: Icon(Icons.arrow_right_rounded),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

void myTap() {
  print("I am tapped");
}

void navRoute() {
  //do what you like here
}

class SecondPage extends ConsumerWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int count = ref.watch(appCount);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "$count",
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
