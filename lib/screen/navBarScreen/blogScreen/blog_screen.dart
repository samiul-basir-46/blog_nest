import 'package:blog_app/helper/routes.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

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
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: isLandscape ? size.width * 0.03 : size.height * 0.03,
            ),
          ),
          SizedBox(width: 10),
        ],
        title: Text(
          "Blog",
          style: TextStyle(
            color: Colors.white,
            fontSize: isLandscape ? size.width * 0.03 : size.height * 0.02,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: ListView.builder(
            itemCount: 50,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.blogDetails);
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.65,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Technology",
                              style: TextStyle(color: Color(0xFF9EA6BA)),
                            ),
                            Text(
                              "The Future of Ai in Software Development",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: isLandscape
                                    ? size.width * 0.03
                                    : size.height * 0.02,
                              ),
                            ),
                            Text(
                              "Explore how AI is transforming software development, from code generation to automated testing.",
                              style: TextStyle(color: Color(0xFF9EA6BA)),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Image.asset(
                            "assets/images/asset.png",
                            height: isLandscape
                                ? size.height * 0.3
                                : size.height * 0.15,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.network(
                                "https://img.icons8.com/?size=50&id=j1UxMbqzPi7n&format=png",
                                color: Colors.white,
                                height: isLandscape
                                    ? size.height * 0.3
                                    : size.height * 0.15,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
