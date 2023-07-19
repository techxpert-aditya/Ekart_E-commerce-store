import 'package:emart/consts/consts.dart';

Widget appLogo() {
  // using velocity_x
  return Image.asset(icAppLogo)
      .box
      .white
      .size(77, 77)
      .padding(const EdgeInsets.all(8))
      .rounded
      .make();
}
