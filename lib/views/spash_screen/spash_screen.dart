import 'package:emart/consts/consts.dart';
import 'package:emart/widgets_common/appLogo_widget.dart';
import 'package:get/get.dart';

import '../auth_screen/login_screen.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

class SpashScreen extends StatefulWidget {
  const SpashScreen({super.key});

  @override
  State<SpashScreen> createState() => _SpashScreenState();
}

// creating a fuction to change screen
changeScreen() {
  Future.delayed(
      const Duration(
        seconds: 3,
      ), () {
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));

    // using getX
    Get.to(() => const LoginScreen());
  });
}

class _SpashScreenState extends State<SpashScreen> {
  @override
  void initState() {
    super.initState();
    changeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        body: Center(
            child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                icSplashBg,
                width: 300,
              ),
            ),
            50.heightBox,
            appLogo(),
            10.heightBox,
            appname.text.fontFamily(bold).size(20).white.make(),
            5.heightBox,
            appversion.text.white.make(),
            const Spacer(),
            credits.text.white.make(),
            30.heightBox,
          ],
        )));
  }
}
