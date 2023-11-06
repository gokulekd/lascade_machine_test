import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lascade_machine_test/pages/database%20module/widgets/data_listing_widget.dart';

import '../controller/api_get_controller.dart';

class DataBaseMainPage extends StatefulWidget {
  const DataBaseMainPage({super.key});

  @override
  State<DataBaseMainPage> createState() => _DataBaseMainPageState();
}

class _DataBaseMainPageState extends State<DataBaseMainPage> {
  final ApiController controller = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(Icons.arrow_back_ios_new_sharp),
        title: const Text("London"),
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Color.fromARGB(255, 39, 60, 176)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ),
      body: Obx(
        () => controller.isDataLoading.value
            ? const Center(child: CircularProgressIndicator())
            : DefaultTabController(
                length: 4,
                child: SafeArea(
                  child: CustomScrollView(shrinkWrap: true,
                    slivers: <Widget>[
                      SliverAppBar(
                        centerTitle: true,
                        expandedHeight: 140.0,
                        pinned: true,
                        flexibleSpace: FlexibleSpaceBar(
                            expandedTitleScale: 1,
                            collapseMode: CollapseMode.parallax,
                            background: Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.blue,
                                    Color.fromARGB(255, 39, 60, 176)
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: textFormFieldDataBase(),
                              ),
                            )),
                        bottom: const TabBar(
                          labelPadding: EdgeInsets.symmetric(
                              horizontal: 5.0), // Adjust the horizontal padding
                          labelStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                          dividerColor: Colors.white,
                          indicatorColor: Colors.white,
                          indicatorSize: TabBarIndicatorSize.label,
                          // labelPadding: EdgeInsets.all(0),
                          indicatorPadding: EdgeInsets.only(bottom: 10),
                          tabs: [
                            Tab(text: 'Recommended'),
                            Tab(text: 'Price'),
                            Tab(text: 'Distance'),
                            Tab(text: 'Class'),
                          ],
                        ),
                      ),
                      SliverFillRemaining(
                        child: TabBarView(dragStartBehavior: DragStartBehavior.down,
                          children: [
                            ListView.builder(
                              
                              shrinkWrap: true,
                              itemCount: controller.apiData.first.result.length,
                              itemBuilder: (context, index) {
                                return DataListingWidget(
                                    dataModels:
                                        controller.apiData.first.result[index],
                                    title: controller
                                        .apiData.first.result[index].title,
                                    description: controller.apiData.first
                                        .result[index].description,
                                    imageUrl: controller
                                        .apiData.first.result[index].imageUrl);
                              },
                            ),
                            const Center(child: Text('Tab 2 Content')),
                            const Center(child: Text('Tab 3 Content')),
                            const Center(child: Text('Tab 4 Content')),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

Widget textFormFieldDataBase() {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: 'Planets',
        prefixIcon: const Icon(Icons.arrow_back_ios_new_rounded,
            color: Colors.blueGrey),

        // Prefix icon
        suffixIcon: const Icon(
          Icons.align_horizontal_right_outlined,
          color: Colors.blueGrey,
        ), // Suffix icon),
        filled: true, // Add a background color
        fillColor: Colors.white, // Set the background color
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintStyle: const TextStyle(color: Colors.grey),
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: Colors.grey), // Border color when focused
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    ),
  );
}

Widget dataWidget({required IconData icon, required String name}) {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0, bottom: 8, right: 5),
    child: Container(
      decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Colors.grey),
          borderRadius: BorderRadius.circular(40)),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(children: [
          Icon(
            icon,
            color: const Color.fromARGB(255, 27, 76, 101),
          ),
          Text(
            name,
            style: const TextStyle(
              color: Color.fromARGB(255, 27, 76, 101),
            ),
          ),
        ]),
      ),
    ),
  );
}
