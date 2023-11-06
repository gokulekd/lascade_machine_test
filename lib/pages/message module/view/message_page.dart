import 'package:flutter/material.dart';
import 'package:lascade_machine_test/constant/colors.dart';
import 'package:lascade_machine_test/pages/favorite%20module/widgets/favorite_listing_widget.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
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
        child:ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return FavoriteListingWidget(
                      title: "Title",
                      description: "descriptions",
                      imageUrl: "https://images.unsplash.com/photo-1545156521-77bd85671d30?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cGxhbmV0fGVufDB8fDB8fHww");
                },
              ),
      ),
    );
  }
}
