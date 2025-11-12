import 'package:blog_app/helper/routes.dart';
import 'package:blog_app/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class BookmarkScreen extends StatelessWidget {
  final VoidCallback onBackHome;

  const BookmarkScreen({super.key, required this.onBackHome});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: onBackHome,
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: isLandscape ? size.width * 0.03 : size.height * 0.02,
          ),
        ),
        title: Text(
          "Bookmarks",
          style: TextStyle(
            color: Colors.white,
            fontSize: isLandscape ? size.width * 0.03 : size.height * 0.02,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                height: isLandscape ? size.height * 0.03 : size.height * 0.02,
              ),
              CustomTextField(
                hinText: "Search Bookmarks",
                prefixIcon: Icon(Icons.search, color: AppColors.hintColor),
                width: isLandscape ? size.width * 0.6 : double.infinity,
              ),
              SizedBox(
                height: isLandscape ? size.height * 0.03 : size.height * 0.02,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoute.blogDetails);
                        },
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset(
                                "assets/images/onboard.png",
                                height: isLandscape
                                    ? size.height * 0.25
                                    : size.height * 0.07,
                                width: isLandscape
                                    ? size.width * 0.22
                                    : size.width * 0.3,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.network(
                                    "https://img.icons8.com/?size=50&id=j1UxMbqzPi7n&format=png",
                                    color: Colors.white,
                                    height: isLandscape
                                        ? size.height * 0.25
                                        : size.height * 0.07,
                                    width: isLandscape
                                        ? size.width * 0.22
                                        : size.width * 0.3,
                                  );
                                },
                              ),
                            ),
                            SizedBox(width: 20),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "SEO Strategies for Beginners",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: isLandscape
                                          ? size.width * 0.03
                                          : size.height * 0.02,
                                    ),
                                  ),
                                  Text(
                                    "A comprehensive guide to understanding and implementing",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: isLandscape
                                          ? size.width * 0.023
                                          : size.height * 0.015,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
