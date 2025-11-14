import 'dart:math';

import 'package:blog_app/helper/get_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';

class BlogDetails extends StatefulWidget {
  final int blogId;

  const BlogDetails({super.key, required this.blogId});

  @override
  State<BlogDetails> createState() => _BlogDetailsState();
}

class _BlogDetailsState extends State<BlogDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<GetPost>(context, listen: false);
      provider.fetchSingleBlog(widget.blogId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final singleProvider = Provider.of<GetPost>(context);

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
      body: singleProvider.isLoading
          ? Center(child: CircularProgressIndicator(color: Colors.white))
          : singleProvider.singleBlog == null
          ? Center(
              child: Text(
                "No data fount!",
                style: TextStyle(color: Colors.white),
              ),
            )
          : SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: isLandscape
                          ? size.height * 0.6
                          : size.height * 0.4,
                      width: isLandscape ? size.width * 0.6 : double.infinity,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Center(
                        child: Image.network(
                          singleProvider.singleBlog!.image ??
                              "https://img.icons8.com/?size=50&id=j1UxMbqzPi7n&format=png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: isLandscape
                          ? size.height * 0.03
                          : size.height * 0.01,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              singleProvider.singleBlog!.title,
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
                              leading: CircleAvatar(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network(
                                    singleProvider.singleBlog!.avatar,
                                  ),
                                ),
                              ),
                              minLeadingWidth: 0,
                              contentPadding: EdgeInsets.all(0),
                              title: Text(
                                singleProvider.singleBlog!.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'FontMain',
                                  fontSize: isLandscape
                                      ? size.width * 0.03
                                      : size.height * 0.02,
                                ),
                              ),
                              // subtitle: Text(
                              //   singleProvider.singleBlog!.bio,
                              //   style: TextStyle(
                              //     color: Colors.grey,
                              //     fontFamily: 'FontMain',
                              //     fontSize: isLandscape
                              //         ? size.width * 0.03
                              //         : size.height * 0.018,
                              //   ),
                              // ),
                            ),
                            SizedBox(
                              height: isLandscape
                                  ? size.height * 0.03
                                  : size.height * 0.01,
                            ),
                            Text(
                              singleProvider.singleBlog!.content,
                              textAlign: TextAlign.justify,
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
                                  singleProvider.singleBlog!.likeCount,
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
                                  singleProvider.singleBlog!.commentCount,
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
