import 'package:emart/consts/consts.dart';
import 'package:emart/controllers/home_controller.dart';

import '../cart_screen/cart_screen.dart';
import '../catagories_screen/catagories_screen.dart';
import '../profile_screen/profile_screen.dart';
import 'home_screen.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

class Home extends StatelessWidget {
  Home({super.key});

  // creating the home controller for the tabs
  final HomeController controller = Get.put(HomeController());

  // navbar item
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

  final List<Widget> navBody = const [
    HomeScreen(),
    CatagoriesScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber,
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => navBody.elementAt(controller.currentNavIndex.value),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          backgroundColor: whiteColor,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedItemColor: redColor,
          selectedLabelStyle: const TextStyle(
            fontFamily: semiBold,
          ),
          items: navBarItems,
          onTap: (value) {
            controller.currentNavIndex.value = value;
          },
        ),
      ),
    );
  }
}
