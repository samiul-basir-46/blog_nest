import 'package:blog_app/helper/auth_api.dart';
import 'package:blog_app/helper/get_api.dart';
import 'package:blog_app/helper/routes.dart';
import 'package:blog_app/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final profileProvider = Provider.of<GetPost>(context, listen: false);
    profileProvider.fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    final isLandscape =
        MediaQuery
            .of(context)
            .orientation == Orientation.landscape;

    final profileProvider = Provider.of<GetPost>(context);
    final authProvider = Provider.of<AuthApiServices>(context);

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
              Icons.settings,
              color: Colors.white,
              size: isLandscape ? size.width * 0.03 : size.height * 0.027,
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                    height: isLandscape
                        ? size.height * 0.03
                        : size.height * 0.02,
                  ),
                  (profileProvider.isLoading || profileProvider.profile == null)
                      ? Column(
                    children: [
                      Container(
                        height: isLandscape
                            ? size.height * 0.25
                            : size.height * 0.14,
                        width: isLandscape
                            ? size.width * 0.2
                            : size.width * 0.4,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/images/avatar.png"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: isLandscape
                            ? size.height * 0.03
                            : size.height * 0.02,
                      ),
                      Text(
                        ".......",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isLandscape
                              ? size.width * 0.03
                              : size.height * 0.024,
                        ),
                      ),
                      Text(
                        ".......@gmail.com",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: isLandscape
                              ? size.width * 0.02
                              : size.height * 0.019,
                        ),
                      ),
                      Text(
                        "01.........",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: isLandscape
                              ? size.width * 0.02
                              : size.height * 0.019,
                        ),
                      ),
                    ],
                  )
                      : Column(
                    children: [
                      Container(
                        height: isLandscape
                            ? size.height * 0.25
                            : size.height * 0.14,
                        width: isLandscape
                            ? size.width * 0.2
                            : size.width * 0.4,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/images/avatar.png"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: isLandscape
                            ? size.height * 0.03
                            : size.height * 0.02,
                      ),
                      Text(
                        profileProvider.isLoading
                            ? "......."
                            : profileProvider.profile!.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isLandscape
                              ? size.width * 0.03
                              : size.height * 0.024,
                        ),
                      ),
                      Text(
                        profileProvider.isLoading
                            ? ".......@gmail.com"
                            : profileProvider.profile!.email,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: isLandscape
                              ? size.width * 0.02
                              : size.height * 0.019,
                        ),
                      ),
                      Text(
                        profileProvider.isLoading
                            ? "01........."
                            : profileProvider.profile!.phone,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: isLandscape
                              ? size.width * 0.02
                              : size.height * 0.019,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: isLandscape
                        ? size.height * 0.03
                        : size.height * 0.04,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.editProfile);
                    },
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.textFieldColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(Icons.edit_outlined, color: Colors.white),
                        ),
                        SizedBox(width: 15),
                        Text(
                          "Edit Profile",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isLandscape
                                ? size.width * 0.02
                                : size.height * 0.019,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: isLandscape
                        ? size.height * 0.04
                        : size.height * 0.02,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.updatePassword);
                    },
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.textFieldColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(Icons.lock, color: Colors.white),
                        ),
                        SizedBox(width: 15),
                        Text(
                          "Update Password",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isLandscape
                                ? size.width * 0.02
                                : size.height * 0.019,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: isLandscape
                        ? size.height * 0.07
                        : size.height * 0.25,
                  ),
                  CustomButton(
                    title: "Log out",
                    color: AppColors.textFieldColor,
                    onTap: () {
                      authProvider.logOut();
                      Navigator.pushNamed(context, AppRoute.login);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
