import 'package:flutter/material.dart';
import 'package:lascade_machine_test/constant/colors.dart';
import 'package:lascade_machine_test/constant/network_images.dart';
import 'package:lascade_machine_test/constant/text_theme.dart';
import 'package:lascade_machine_test/pages/home%20page%20module/widgets/carousel_slider_widget.dart';
import 'package:lascade_machine_test/pages/home%20page%20module/widgets/galaxies_list_widget.dart';
import 'package:text_divider/text_divider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late final TextEditingController searchBarController;

  @override
  void initState() {
    searchBarController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkThemeColor,
      body: SafeArea(
        child: ListView(
          children: [
            //logo widget and profile widget with image
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //logo widget

                  Stack(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          gradient: logoGradient,
                          borderRadius: BorderRadius.circular(50),
                          //   color: Colors.blue,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Galaxia",
                          style: mainLogoStyle,
                        ),
                      )
                    ],
                  ),
                  //user profile widget

                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: shadowColor),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30)),
                          height: 40,
                          width: 40,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              userImage,
                              fit: BoxFit.cover,
                              scale: 0.5,
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search your destination',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),

                  // Prefix icon
                  suffixIcon: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: logoGradient),
                    child: const Center(
                        child: Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 15,
                      color: Colors.white,
                    )),
                  ), // Suffix icon),
                  filled: true, // Add a background color
                  fillColor: shadowColor, // Set the background color
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  hintStyle: const TextStyle(color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.grey), // Border color when focused
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ),

            const ImageCarousel(),
            const SizedBox(
              height: 20,
            ),
            TextDivider.horizontal(
              text: Text(
                'Galaxies',
                style: fontHeader1,
              ),
              color: const Color.fromARGB(255, 18, 67, 106),
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GalaxiesListWidget(),
                  GalaxiesListWidget(),
                  GalaxiesListWidget(),
                  GalaxiesListWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
