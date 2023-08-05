import 'package:emart/views/spash_screen/spash_screen.dart';
import 'package:flutter/services.dart';
import 'consts/consts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
          Brightness.dark, // Change this to Brightness.light if needed
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness:
          Brightness.dark, // Change this to Brightness.light if needed
    ));

    // we are using velocity_x, so we need to change the materialApp to getMaterialApp
    return GetMaterialApp(
      title: appname,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          // elevation: 0,
        ),
        fontFamily: regular,
      ),
      home: const SpashScreen(),
    );
  }
}
