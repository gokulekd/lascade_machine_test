
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lascade_machine_test/pages/database%20module/model/data_model.dart';
import 'package:lascade_machine_test/pages/database%20module/view/data_base_main_page.dart';
import 'package:lascade_machine_test/pages/favorite%20module/controller/favorite_controller.dart';

List<Result> favoriteData = [];

// ignore: must_be_immutable
class DataListingWidget extends StatefulWidget {
  String title;
  String description;
  String imageUrl;
  Result dataModels;
  DataListingWidget(
      {super.key,
      required this.dataModels,
      required this.title,
      required this.description,
      required this.imageUrl});

  @override
  State<DataListingWidget> createState() => _DataListingWidgetState();
}

class _DataListingWidgetState extends State<DataListingWidget> {
  final FavoriteController favoriteController = Get.put(FavoriteController());

  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: widget.imageUrl,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                    child: SizedBox(
                      width: width * 0.5,
                      child: Text(
                          widget.title.isEmpty
                              ? "No title found"
                              : widget.title,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: widget.title.isEmpty
                                  ? const Color.fromARGB(255, 160, 104, 104)
                                  : Colors.blueGrey)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (isLiked) {
                                favoriteController
                                    .removeData(widget.dataModels);
                                isLiked = false;
                              } else {
                                favoriteController.addData(widget.dataModels);
                                isLiked = true;
                              }
                            });
                          },
                          icon: isLiked
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : const Icon(Icons.favorite_border)),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: width * 0.25),
                  dataWidget(icon: Icons.sunny, name: "475987 KM"),
                  dataWidget(
                      icon: Icons.wifi_tethering, name: "2.4575 x 10^23 KG"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: width * 0.25),
                  dataWidget(
                      icon: Icons.shopping_bag_outlined, name: "1 Large"),
                  dataWidget(icon: Icons.people, name: "8 passengers"),
                ],
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  widget.description.isEmpty
                      ? "No description found"
                      : widget.description,
                  style: TextStyle(
                      color: widget.description.isEmpty
                          ? const Color.fromARGB(255, 160, 104, 104)
                          : Colors.blueGrey),
                ),
              ),
              const DottedLine(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                lineLength: double.infinity,
                lineThickness: 1.0,
                dashLength: 5.0,
                dashColor: Colors.grey,
                dashRadius: 0.0,
                dashGapLength: 4.0,
                dashGapRadius: 0.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("\$ 7000/Day",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 32, 54, 144))),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Container(
                        height: 44.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(colors: [
                              Color.fromARGB(255, 118, 125, 203),
                              Color.fromARGB(255, 20, 69, 110)
                            ])),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(100, 40),
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent),
                          child: const Text(
                            'Book',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Text("\$ 140 total (from 3 sites)",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
