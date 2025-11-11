import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class BlogDetails extends StatelessWidget {
  const BlogDetails({super.key});

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
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.bookmark_border_outlined,
              color: Colors.white,
              size: isLandscape ? size.width * 0.03 : size.height * 0.03,
            ),
          ),
          SizedBox(width: 10),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: isLandscape ? size.width * 0.03 : size.height * 0.02,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: isLandscape ? size.height * 0.6 : size.height * 0.4,
                width: isLandscape ? size.width * 0.6 : double.infinity,
                decoration: BoxDecoration(color: Colors.white),
              ),
              SizedBox(
                height: isLandscape ? size.height * 0.03 : size.height * 0.01,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "SEO Strategies for Beginners",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'FontMain',
                          fontSize: isLandscape
                              ? size.width * 0.03
                              : size.height * 0.026,
                        ),
                      ),
                      SizedBox(
                        height: isLandscape
                            ? size.height * 0.03
                            : size.height * 0.02,
                      ),
                      ListTile(
                        leading: CircleAvatar(),
                        minLeadingWidth: 0,
                        contentPadding: EdgeInsets.all(0),
                        title: Text(
                          "Author",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'FontMain',
                            fontSize: isLandscape
                                ? size.width * 0.03
                                : size.height * 0.02,
                          ),
                        ),
                        subtitle: Text(
                          "Olivia Harper",
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'FontMain',
                            fontSize: isLandscape
                                ? size.width * 0.03
                                : size.height * 0.018,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: isLandscape
                            ? size.height * 0.03
                            : size.height * 0.01,
                      ),
                      Text(
                        "In a world increasingly aware of its environmental footprint, the concept of sustainable living has moved from a niche lifestyle to a mainstream necessity. This article explores the innovative approaches and technologies that are shaping a greener future, from renewable energy solutions to eco-friendly consumer products.",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'FontMain',
                          fontSize: isLandscape
                              ? size.width * 0.025
                              : size.height * 0.018,
                        ),
                      ),
                      SizedBox(
                        height: isLandscape
                            ? size.height * 0.03
                            : size.height * 0.015,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_border),
                          ),
                          SizedBox(width: 7),
                          Text(
                            "123",
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'FontMain',
                            ),
                          ),
                          SizedBox(width: 40),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.comment),
                          ),
                          SizedBox(width: 7),
                          Text(
                            "45",
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'FontMain',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: isLandscape
                            ? size.height * 0.03
                            : size.height * 0.01,
                      ),
                      Text(
                        "Comments",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'FontMain',
                          fontSize: isLandscape
                              ? size.width * 0.025
                              : size.height * 0.02,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
