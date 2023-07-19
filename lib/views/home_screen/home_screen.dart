import 'package:emart/consts/consts.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<BottomNavigationBarItem> navBarItems = [
    BottomNavigationBarItem(
        icon: Image.asset(
          icHome,
          height: 26,
        ),
        label: home),
    BottomNavigationBarItem(
        icon: Image.asset(
          icCategories,
          height: 26,
        ),
        label: catagories),
    BottomNavigationBarItem(
        icon: Image.asset(
          icCart,
          height: 26,
        ),
        label: cart),
    BottomNavigationBarItem(
        icon: Image.asset(
          icProfile,
          height: 26,
        ),
        label: account),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Container(),
      // bottomNavigationBar: BottomNavigationBar(items: list),
    );
  }
}
