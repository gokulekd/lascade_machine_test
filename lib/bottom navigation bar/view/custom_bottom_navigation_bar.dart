import 'package:flutter/material.dart';
import 'package:lascade_machine_test/constant/bottom_navigation_bar_icons.dart';
import 'package:lascade_machine_test/constant/colors.dart';
import 'package:lascade_machine_test/pages/favorite%20module/view/favorite_page.dart';
import 'package:lascade_machine_test/pages/home%20page%20module/view/home_page.dart';
import 'package:lascade_machine_test/pages/message%20module/view/message_page.dart';
import 'package:lascade_machine_test/pages/database%20module/view/data_base_main_page.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  var currentIndex = 0;
  List pages = [
    const Homepage(),
    const DataBaseMainPage(),
    const FavoritePage(),
    const MessagePage(),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: darkThemeColor,
      body: pages[currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: size.width * .20,
          decoration: BoxDecoration(
            color: colorNavBar,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.15),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              bottomNavBarWidget(
                  index: 0,
                  size: size,
                  iconData: bottomNavigationBarIconsList[0]),
              bottomNavBarWidget(
                  index: 1,
                  size: size,
                  iconData: bottomNavigationBarIconsList[1]),
              bottomNavBarWidget(
                  index: 2,
                  size: size,
                  iconData: bottomNavigationBarIconsList[2]),
              bottomNavBarWidget(
                  index: 3,
                  size: size,
                  iconData: bottomNavigationBarIconsList[3])
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomNavBarWidget(
      {required int index, required Size size, required IconData iconData}) {
    return InkWell(
      onTap: () {
        setState(
          () {
            currentIndex = index;
          },
        );
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: size.width * .076,
            color: index == currentIndex ? Colors.white : Colors.grey,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.fastLinearToSlowEaseIn,
            margin: EdgeInsets.only(
              bottom: index == currentIndex ? 0 : size.width * .029,
              right: size.width * .0422,
              left: size.width * .0422,
            ),
            width: size.width * .02,
            height: index == currentIndex ? size.width * .02 : 0,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ],
      ),
    );
  }
}
