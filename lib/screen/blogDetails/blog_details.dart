import 'package:flutter/material.dart';

class BlogDetails extends StatelessWidget {
  const BlogDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Text("Blog Details", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
