import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lascade_machine_test/constant/colors.dart';
import 'package:lascade_machine_test/pages/favorite%20module/controller/favorite_controller.dart';
import 'package:lascade_machine_test/pages/favorite%20module/widgets/favorite_listing_widget.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final FavoriteController controller = Get.find<FavoriteController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(Icons.arrow_back_ios_new_sharp),
        title: const Text("Favorite"),
        backgroundColor: darkThemeColor,
        elevation: 0,
      ),
      backgroundColor: darkThemeColor,
      body: SafeArea(
        child: Obx(
          () => controller.dataList.isEmpty
              ? const Center(
                  child: Text(
                  "No favorite Data found",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ))
              : ListView.builder(
                  itemCount: controller.dataList.length,
                  itemBuilder: (context, index) {
                    return FavoriteListingWidget(
                        title: controller.dataList[index].title,
                        description: controller.dataList[index].description,
                        imageUrl: controller.dataList[index].imageUrl);
                  },
                ),
        ),
      ),
    );
  }
}
