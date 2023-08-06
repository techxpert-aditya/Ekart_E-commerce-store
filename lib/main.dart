import 'package:emart/views/splash_screen/splash_screen.dart';
import 'package:flutter/services.dart';
import 'consts/consts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: const SplashScreen(),
    );
  }
}
