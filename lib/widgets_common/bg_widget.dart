import 'package:emart/consts/consts.dart';

Widget background({required Widget child}) {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(imgBackground),
        fit: BoxFit.cover,
      ),
    ),
    child: child,
  );
}
