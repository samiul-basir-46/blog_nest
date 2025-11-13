import 'package:blog_app/helper/get_api.dart';
import 'package:blog_app/helper/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/colors.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final getProvider = Provider.of<GetPost>(context, listen: false);
      if (getProvider.blogs.isEmpty) {
        getProvider.fetchPost();
      }
    });

    final size = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Blog",
          style: TextStyle(
            color: Colors.white,
            fontSize: isLandscape ? size.width * 0.03 : size.height * 0.02,
          ),
        ),
      ),
      body: Consumer<GetPost>(
        builder: (context, getProvider, _) {
          if (getProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          } else if (getProvider.errorMessage != null) {
            return Center(
              child: Text(
                getProvider.errorMessage!,
                style: const TextStyle(color: Colors.redAccent),
              ),
            );
          } else if (getProvider.blogs.isEmpty) {
            return const Center(
              child: Text(
                'No blogs found',
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                itemCount: getProvider.blogs.length,
                itemBuilder: (context, index) {
                  final blog = getProvider.blogs[index];
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
                                  blog.categories.isNotEmpty
                                      ? blog.categories[0]
                                      : '',
                                  style: const TextStyle(color: Color(0xFF9EA6BA)),
                                ),
                                Text(
                                  blog.title,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: isLandscape
                                        ? size.width * 0.03
                                        : size.height * 0.02,
                                  ),
                                ),
                                Text(
                                  blog.excerpt,
                                  style: const TextStyle(color: Color(0xFF9EA6BA)),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Image.network(
                              blog.image,
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
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
